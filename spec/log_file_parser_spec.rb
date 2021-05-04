# frozen_string_literal: true

require_relative '../lib/log_file_parser'
require 'tempfile'
require_relative '../lib/exception_handler'

describe LogFileParser do
  subject { described_class.new(log_file_path).perform }

  let(:log_file_path) do
    Tempfile.new(['webserver', '.log']).tap do |file|
      file.write(input)
      file.rewind
    end
  end

  context 'with no file name' do
    let(:log_file_path) { nil }

    it 'should raise a missing file error' do
      expect { subject }.to raise_error(FileNameNotFound)
    end
  end

  context 'with empty file name' do
    let(:log_file_path) { '' }

    it 'should raise a missing file error' do
      expect { subject }.to raise_error(FileDoesNotExist)
    end
  end

  context 'with non existing file' do
    let(:log_file_path) { 'fake.log' }

    it 'should raise a missing file error' do
      expect { subject }.to raise_error(FileDoesNotExist)
    end
  end

  context 'with incorrect file format' do
    let(:input) do
      <<~LOGFILE
        /home
        /index
        /home
        /index
      LOGFILE
    end

    it 'should raise an incorrect format error' do
      expect { subject }.to raise_error(InvalidFileFound)
    end
  end

  context 'with empty file' do
    let(:input) do
      <<~LOGFILE

      LOGFILE
    end

    it 'should raise an incorrect format error' do
      expect { subject }.to raise_error(InvalidFileFound)
    end
  end

  context 'with correct file format' do
    let(:input) do
      <<~LOGFILE
        /index 8.9.3.1
        /home 1.2.3.4
        /index 5.6.7.8
        /contact 5.6.7.3
        /home 1.2.3.4
        /index 2.3.4.5
      LOGFILE
    end

    let(:expected_result) do
      {
        '/index' => %w[8.9.3.1 5.6.7.8 2.3.4.5],
        '/home' => %w[1.2.3.4 1.2.3.4],
        '/contact' => %w[5.6.7.3]
      }
    end

    it 'should parse file and return hash map' do
      expect(subject).to eq(expected_result)
    end
  end
end

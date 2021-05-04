# frozen_string_literal: true

require_relative '../lib/print_page_view'

describe PrintPageView do
  subject { described_class.new(log_file_path).perform }

  context 'with log file' do
    let(:log_file_path) { 'webserver.log' }
    let(:expected_output) do
      <<~OUTPUT

        Total page views:
        /about/2        90 visits
        /contact        89 visits
        /index          82 visits
        /about          81 visits
        /help_page/1    80 visits
        /home           78 visits

        Unique page views:
        /help_page/1    23 unique views
        /contact        23 unique views
        /home           23 unique views
        /index          23 unique views
        /about/2        22 unique views
        /about          21 unique views
      OUTPUT
    end

    it 'should return a list of page vists' do
      expect { subject }.to output(expected_output).to_stdout
    end
  end
end

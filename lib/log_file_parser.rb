# frozen_string_literal: true

require_relative 'exception_handler'

class LogFileParser
  attr_reader :parsed_results

  def initialize(log_file_path)
    @log_file_path = log_file_path
    validate_file
    @log = File.open(log_file_path)
    @parsed_results = Hash.new { |hash, key| hash[key] = [] }
  end

  def perform
    parse_file
    parsed_results
  end

  private

  def parse_file
    @log.each do |line|
      path, ip = line.split
      invalid_file_found if ip.nil?
      parsed_results[path] << ip
    end
  end

  def validate_file
    raise FileNameNotFound if @log_file_path.nil?
    raise FileDoesNotExist unless File.exist?(@log_file_path)
  end

  def invalid_file_found
    raise InvalidFileFound
  end
end

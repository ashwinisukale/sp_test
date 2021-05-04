# frozen_string_literal: true

require_relative 'log_file_parser'
require_relative 'formatter/total_visits'
require_relative 'formatter/unique_views'
require_relative 'presenter'

class PrintPageView
  def initialize(log_file_path)
    @parsed_results = LogFileParser.new(log_file_path).perform
  end

  def perform
    Presenter.new(@parsed_results, formatters).perform
  end

  private

  def formatters
    # Just add new formatter class here, which you want to see in your output
    [Formatter::TotalVisits, Formatter::UniqueViews]
  end
end

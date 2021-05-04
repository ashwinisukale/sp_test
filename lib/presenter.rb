# frozen_string_literal: true

class Presenter
  def initialize(parsed_results, formatters)
    @parsed_results = parsed_results
    @formatters = formatters
  end

  def perform
    @formatters.each do |formatter|
      puts formatter.new.perform(@parsed_results)
    end
  end
end

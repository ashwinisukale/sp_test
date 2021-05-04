# frozen_string_literal: true

require_relative 'base'

module Formatter
  class TotalVisits < Base
    private

    def visits(parsed_results)
      parsed_results.sort_by { |_path, ips| -ips.count }
    end

    def views_count(views)
      views.count
    end

    def description
      'visits'
    end

    def header
      "\nTotal page views:\n"
    end
  end
end

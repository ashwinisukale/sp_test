# frozen_string_literal: true

require_relative 'base'

module Formatter
  class UniqueViews < Base
    private

    def visits(parsed_results)
      parsed_results.sort_by { |_path, ips| -ips.uniq.count }
    end

    def views_count(views)
      views.uniq.count
    end

    def description
      'unique views'
    end

    def header
      "\nUnique page views:\n"
    end
  end
end

# frozen_string_literal: true

module Formatter
  # Base formatter will concatenate results of all the given child formatters
  class Base
    def perform(parsed_results)
      visits(parsed_results).map do |path, views|
        format('%-15<path>s %<views>d %<description>s',
               path: path, views: views_count(views), description: description)
      end.join("\n").prepend(header)
    end
  end
end

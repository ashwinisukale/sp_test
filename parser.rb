#!/usr/bin/env ruby
# frozen_string_literal: true

require_relative 'lib/print_page_view'

PrintPageView.new(ARGV[0]).perform

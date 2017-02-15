#!/usr/bin/env ruby
require_relative '../lib/log_reader.rb'

if ARGV.empty?
  puts "You must include: log/webserver.log \nexample: ./bin/parser.rb log/webserver.log"
else

  log_reader = LogReader.new(File.read(ARGV[0]))

  log_reader.save_logs

  puts "> list of webpages with most page views ordered from most pages views to less page views"
  log_reader.display_url_by_visits

  puts "\n"

  puts "> list of webpages with most unique page views also ordered"
  log_reader.display_url_by_visits_with_unique_views

end

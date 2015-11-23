desc 'Filling the db with fixtures'
task :fill do
  class_name = ENV['MODEL'].strip.capitalize!
  file_name = class_name.downcase
  parser_name = "Parser#{ENV['FORMAT'].strip.capitalize!}"

  require_relative "../models/#{file_name}"
  require_relative "../parser/parser"

  model = Object.const_get(class_name).new
  data = Parser.new(parser_name, file_name).loader.parse
  model.save_parsed_bunch(data)
  puts 'Done!'
end

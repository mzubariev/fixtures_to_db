desc 'Filling the db with fixtures'
task :fill do
  class_name = ENV['MODEL'].strip.capitalize
  model_file_name = class_name.downcase
  format = ENV['FORMAT'].strip.downcase

  require_relative "../models/#{model_file_name}"

  model = Object.const_get(class_name).new
  model.send("parse_#{format}", model_file_name)
  model.save_parsed_bunch
  puts 'Done!'
end

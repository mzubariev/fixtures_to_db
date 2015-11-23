require 'capybara/cucumber'
$LOAD_PATH.unshift(File.dirname(__FILE__) + '/../../lib')

require 'models/post'
require 'models/user'
require 'parser/parser'

module CustomWorld
  def save_to_db(parser_name, model_name)
    class_name = model_name.capitalize
    model = Object.const_get(class_name).new
    data = Parser.new(parser_name, model_name).loader.parse
    model.save_parsed_bunch(data)
  end
end

World(CustomWorld)
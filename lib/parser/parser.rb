require_relative 'abstract_parser_factory'
require_relative 'parser_ini'
require_relative 'parser_json'

# Abstract Factory pattern

class Parser
  include AbstractParserFactory
  PATH = '../../../datafiles/fixtures/'

  def initialize(class_name, file_name)
    @class_name = class_name
    @file_name = file_name
  end

  def loader
    Object.const_get("#{@class_name}").new(PATH, @file_name)
  end

end

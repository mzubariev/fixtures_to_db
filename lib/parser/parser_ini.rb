require 'inifile'
require_relative './helpers/parser_helper'

class ParserIni
  include ParserHelper

  def initialize(path, file_name)
    @path = path
    @file_name = file_name
  end

  def parse
    content = IniFile.load(File.expand_path("#{@path}#{@file_name}.ini", __FILE__))
    keys = []
    values = []
    content.each do |section, parameter, value|
      keys << parameter
      values << value
    end
    data_preparing(keys, values)
  end
end
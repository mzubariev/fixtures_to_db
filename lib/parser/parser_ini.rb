require 'inifile'
require_relative './helpers/data_former_helper'

class ParserIni
  include DataFormerHelper

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
    data_former(keys, values)
    output_formatted_data
  end
end
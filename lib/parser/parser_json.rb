require 'json'
require_relative './helpers/parser_helper'

class ParserJson
  include ParserHelper

  def initialize(path, file_name)
    @path = path
    @file_name = file_name
  end

  def parse
    data = JSON.parse(File.read(File.expand_path("#{@path}#{@file_name}.json", __FILE__)))
    keys = []
    values = []
    data.each do |d|
      d.each do |k, v|
        keys << k
        values << v
      end
    end
    data_preparing(keys, values)
  end
end

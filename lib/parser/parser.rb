require 'json'
require 'inifile'

module Parser

  PATH = '../../../datafiles/fixtures/'

  def parse_json(filename)
    data = JSON.parse(File.read(File.expand_path("#{PATH}#{filename}.json", __FILE__)))
    keys = []
    values = []
    data.each do |d|
      d.each do |k, v|
        keys << k
        values << v
      end
    end
    data_former(keys, values)
  end

  def parse_ini(filename)
    content = IniFile.load(File.expand_path("#{PATH}#{filename}.ini", __FILE__))
    keys = []
    values = []
    content.each do |section, parameter, value|
      keys << parameter
      values << value
    end
    data_former(keys, values)
  end

  private

  def data_former(keys, values)
    keys = keys.uniq!
    k_length = keys.length
    string_keys = keys.join(', ')
    string_values = ''

    i = 0
    loop do
      if i != values.length - k_length
        temp = values.slice(i, k_length).collect { |x| "'#{x}'" }.join(', ')
        string_values << "(#{temp}), "
      else
        temp = values.slice(i, k_length).collect { |x| "'#{x}'" }.join(', ')
        string_values << "(#{temp})"
        break
      end
      i += k_length
    end
    @@keys = string_keys
    @@values = string_values
  end

end

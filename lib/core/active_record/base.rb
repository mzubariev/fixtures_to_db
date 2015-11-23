require_relative '../db_connect'
require_relative '../../parser/parser'

module ActiveRecord
  class Base

    @@connect = DBConnect.instance.connect

    def initialize(fields = nil)
      # instance values initialization
      fields.each { |k, v| self.send("#{k}=", v) } unless fields.nil?
    end

    def id
      @id
    end

    def id=(id)
      @id = id
    end

    def save
      table_name = get_table_name
      vars = self.instance_variables
      keys = []
      values = []
      vars.each do |var|
        v = var.to_s.sub('@','')
        keys << v
        values << self.send(v)
      end
      keys = keys.join(', ')
      values = values.collect { |x| "'#{x}'" }.join(', ')
      @@connect.query("INSERT INTO #{table_name} (#{keys}) VALUES (#{values})")
    end

    def save_parsed_bunch(data)
      table_name = get_table_name
      @@connect.query("INSERT INTO #{table_name} (#{data[:fields]}) VALUES #{data[:vals]}")
    end

    def self.find(id)
      table_name = self.get_table_name
      result = @@connect.query("SELECT * FROM #{table_name} WHERE id = #{id} LIMIT 1")
      result_array = result.to_a[0]
      self.new(result_array) unless result_array.nil?
    end

    def self.find_by(hash)
      table_name = self.get_table_name
      key = hash.keys[0].to_s
      value = hash.values[0]
      result = @@connect.query("SELECT * FROM #{table_name} WHERE #{key} = '#{value}'")
      result_array = result.to_a
      self.new(result_array[0]) if result_array.length == 1
      result_array
    end

    def destroy()
      table_name = get_table_name
      @@connect.query("DELETE FROM #{table_name} WHERE id = #{@id}")
    end

    protected

    # for class methods
    def self.get_table_name
      self.name.downcase + 's'
    end

    # for instance methods
    def get_table_name
      self.class.name.downcase + 's'
    end

  end
end

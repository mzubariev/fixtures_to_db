require_relative '../db_connect'
require_relative '../../parser/parser'

module ActiveRecord
  class Base

    include Parser

    def initialize(fields = nil, fields_description = nil)
      obj = DBConnect.instance
      @@connect = obj.connect
      @@table_name = self.class.name.downcase + 's'
      @@connect.query("CREATE TABLE IF NOT EXISTS #{@@table_name} (#{fields_description})") unless fields_description.nil?

      # instance values initialization
      fields.each { |k, v| self.send("#{k}=", v) } unless fields.nil?
    end

    def save
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
      @@connect.query("INSERT INTO #{@@table_name} (#{keys}) VALUES (#{values})")
    end

    def save_parsed_bunch
      @@connect.query("INSERT INTO #{@@table_name} (#{@@keys}) VALUES #{@@values}")
    end

    def find(id)
      result = @@connect.query("SELECT * FROM #{@@table_name} WHERE id = #{id} LIMIT 1")
      result_array = result.to_a
      set_instance_vars(result_array[0])
    end

    def find_by(hash)
      key = hash.keys[0].to_s
      value = hash.values[0]
      result = @@connect.query("SELECT * FROM #{@@table_name} WHERE #{key} = '#{value}'")
      result_array = result.to_a
      set_instance_vars(result_array[0]) if result_array.length == 1
      result_array
    end

    def destroy(id)
      @@connect.query("DELETE FROM #{@@table_name} WHERE id = #{id}")
    end

    private

    def set_instance_vars(hash)
      hash.each do |k, v|
        self.send("#{k}=", v) unless k.eql? 'id'
      end
    end

  end
end

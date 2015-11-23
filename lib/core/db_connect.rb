require 'yaml'
require 'mysql2'
require 'pry'

# Singleton pattern

class DBConnect

  attr_reader :connect

  def initialize
    config = YAML.load_file('config/database.yaml')['default']
    @connect ||= Mysql2::Client.new(config)
    @connect.query("ALTER DATABASE #{config['database']} DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci")
  end

  def self.instance
    @instance ||= new
  end

  def self.destroy
    @instance = nil
  end

  private_class_method :new, :clone, :dup
end




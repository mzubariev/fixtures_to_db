require_relative '../core/active_record/base'

class User < ActiveRecord::Base

  attr_accessor :name, :last_name, :age

  def initialize(fields = nil, fields_description = 'id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT, name VARCHAR(30) NOT NULL,
                  last_name VARCHAR(30), age SMALLINT(6), PRIMARY KEY(id)')
    super
  end

end

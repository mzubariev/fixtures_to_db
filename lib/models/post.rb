require_relative '../core/active_record/base'

class Post < ActiveRecord::Base

  accessor :name, :text

  def initialize(fields = nil, fields_description = 'id INT(11) UNSIGNED NOT NULL AUTO_INCREMENT, name VARCHAR(255) NOT NULL,
                  text TEXT, PRIMARY KEY(id)')
    super
  end

end

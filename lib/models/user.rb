require_relative '../core/active_record/base'

class User < ActiveRecord::Base
  attr_accessor :name, :last_name, :age
end

require_relative '../core/active_record/base'

class Post < ActiveRecord::Base
  attr_accessor :name, :text
end

class Category < ActiveRecord::Base
  validates_length_of :name, maximum: 20
end

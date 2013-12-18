class Blog < ActiveRecord::Base
  belongs_to :author, class_name: "User"
  belongs_to :category
  has_many :comments, dependent: :delete_all
  
  validates_associated :category
end

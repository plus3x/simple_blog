class Comment < ActiveRecord::Base
  belongs_to :author
  belongs_to :blog
  
  validates_length_of :rating, in: 1..5
  validates_associated :author, :blog
end

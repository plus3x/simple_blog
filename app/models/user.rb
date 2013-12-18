class User < ActiveRecord::Base
  belongs_to :role
  has_many :blogs
  has_secure_password

  before_validation on: :create do
    self.role ||= Role.find_by(title: 'client')
  end

  validates_length_of :name, in: 1..20
  validates_length_of :password, minimum: 3
  validates_associated :role
end

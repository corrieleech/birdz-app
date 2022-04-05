class User < ApplicationRecord
  has_secure_password
  validates :email, presence: true, uniqueness: true
  validates :name, length: { minimum: 2 }
  
  has_many :checklists
end

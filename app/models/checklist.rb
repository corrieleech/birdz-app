class Checklist < ApplicationRecord
  belongs_to :user
  has_many :likely_birds
  has_many :birds, through: :likely_birds
end

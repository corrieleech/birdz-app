class Bird < ApplicationRecord
  has_many :likely_birds
  has_many :checklists, through: :likely_birds
end

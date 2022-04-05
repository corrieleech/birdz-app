class LikelyBird < ApplicationRecord
  belongs_to :checklist
  belongs_to :bird

  validates :bird_id, uniqueness: true
end

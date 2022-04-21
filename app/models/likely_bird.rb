class LikelyBird < ApplicationRecord
  belongs_to :checklist
  belongs_to :bird
end

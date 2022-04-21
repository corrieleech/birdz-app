class LikelyBird < ApplicationRecord
  belongs_to :checklist
  belongs_to :bird

  def bird_name
    bird = Bird.find(self.bird_id)
    bird.comName
  end

end

class LikelyBirdSerializer < ActiveModel::Serializer
  attributes :id, :bird_id, :bird_name, :has_seen
end

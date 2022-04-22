class ChecklistSerializer < ActiveModel::Serializer
  attributes :id, :name, :locId, :time

  belongs_to :user
  has_many :likely_birds

end

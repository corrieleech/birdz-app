class ChecklistSerializer < ActiveModel::Serializer
  attributes :id, :name, :locId, :simple_date

  belongs_to :user
  has_many :likely_birds

end

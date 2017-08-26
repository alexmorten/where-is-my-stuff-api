class PlanSerializer < ActiveModel::Serializer
  attributes :id, :name, :representation
  has_many :items
end

class ItemSerializer < ActiveModel::Serializer
  attributes :id, :representation, :name, :description
  has_one :plan
end

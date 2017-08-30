class ItemSerializer < ActiveModel::Serializer
  attributes :id, :representation, :name, :description
  belongs_to :plan
end

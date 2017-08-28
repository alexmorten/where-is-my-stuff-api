class PlanSerializer < ActiveModel::Serializer
  attributes :id, :name, :representation, :item_amount
  def item_amount
    object.items.count
  end
end

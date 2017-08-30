class PlanSerializer < ActiveModel::Serializer
  attributes :id, :name, :representation, :item_amount, :current_user_may_modify

  def item_amount
    object.items.count
  end
  def current_user_may_modify
    current_user = instance_options[:current_user]
    if current_user
      return current_user == object.user
    else
      return nil
    end
  end
end

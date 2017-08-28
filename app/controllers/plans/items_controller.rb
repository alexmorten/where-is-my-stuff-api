class Plans::ItemsController < ItemsController
  before_action :set_items
    private
        def set_items
            @items = Plan.find(params[:plan_id]).items
        end
end

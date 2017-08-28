class AddUserToPlan < ActiveRecord::Migration[5.0]
  def change
    add_reference :plans, :user, index: true, type: :uuid
  end
end

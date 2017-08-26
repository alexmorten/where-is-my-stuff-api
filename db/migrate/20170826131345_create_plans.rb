class CreatePlans < ActiveRecord::Migration[5.0]
  def change
    create_table :plans, id: :uuid do |t|
      t.string :name
      t.jsonb :representation, null: false, default: {}
      
      t.timestamps
    end
  end
end

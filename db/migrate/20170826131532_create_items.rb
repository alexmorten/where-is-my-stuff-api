class CreateItems < ActiveRecord::Migration[5.0]
  def change
    create_table :items, id: :uuid do |t|
      t.references :plan, foreign_key: true, type: :uuid
      t.jsonb :representation
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end

class CreateFood < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.integer :refrigerator_id
      t.string :name
      t.boolean :expired
      t.integer :total_items_available

      t.timestamps
    end
  end
end

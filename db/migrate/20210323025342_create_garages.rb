class CreateGarages < ActiveRecord::Migration[5.2]
  def change
    create_table :garages do |t|
      t.string :name
      t.boolean :at_capacity
      t.integer :max_capacity

      t.timestamps
    end
  end
end

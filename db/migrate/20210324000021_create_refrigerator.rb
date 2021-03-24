class CreateRefrigerator < ActiveRecord::Migration[5.2]
  def change
    create_table :refrigerators do |t|
      t.string :name
      t.boolean :has_freezer
      t.integer :capacity_cubic_feet

      t.timestamps
    end
  end
end

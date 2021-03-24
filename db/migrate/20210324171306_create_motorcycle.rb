class CreateMotorcycle < ActiveRecord::Migration[5.2]
  def change
    create_table :motorcycles do |t|
      t.integer :garage_id
      t.string :name
      t.boolean :ride_ready
      t.integer :model_year

      t.timestamps
    end
  end
end

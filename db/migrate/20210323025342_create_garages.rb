class CreateGarages < ActiveRecord::Migration[5.2]
  def change
    create_table :garages do |t|
      t.string :name
      t.datetime :created_at
      t.datetime :updated_at
      t.boolean :at_capacity
      t.integer :max_capacity
    end
  end
end

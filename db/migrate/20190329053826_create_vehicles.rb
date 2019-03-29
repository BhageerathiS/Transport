class CreateVehicles < ActiveRecord::Migration
  def change
    create_table :vehicles do |t|
      t.string :make
      t.string :model
      t.string :variant
      t.string :year
      t.string :veh_class
      t.integer :capacity
      t.string :vahicle_number
      t.string :imageUrl
      t.integer :driver_id

      t.timestamps null: false
    end
  end
end

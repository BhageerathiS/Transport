class CreateJoinTableDriverVehicle < ActiveRecord::Migration
  def change
    create_join_table :drivers, :vehicles do |t|
      # t.index [:driver_id, :vehicle_id]
      # t.index [:vehicle_id, :driver_id]
    end
  end
end

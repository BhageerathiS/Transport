class CreateDrivers < ActiveRecord::Migration
  def change
    create_table :drivers do |t|
      t.string :name
      t.date :dob
      t.string :licence_class
      t.date :issue_date
      t.string :licence_number
      t.integer :vehicle_id

      t.timestamps null: false
    end
  end
end

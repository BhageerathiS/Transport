json.extract! vehicle, :id, :make, :model, :variant, :year, :veh_class, :capacity, :vahicle_number, :imageUrl, :driver_id, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)

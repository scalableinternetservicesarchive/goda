json.array!(@rides) do |ride|
  json.extract! ride, :id, :driver_id, :user_id
  json.url ride_url(ride, format: :json)
end

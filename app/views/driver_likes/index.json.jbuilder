json.array!(@driver_likes) do |driver_like|
  json.extract! driver_like, :id, :driver_id, :quantity
  json.url driver_like_url(driver_like, format: :json)
end

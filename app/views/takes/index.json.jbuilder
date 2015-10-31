json.array!(@takes) do |take|
  json.extract! take, :id, :user_id, :hitcher_id
  json.url take_url(take, format: :json)
end

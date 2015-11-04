json.array!(@hitcher_likes) do |hitcher_like|
  json.extract! hitcher_like, :id, :hitcher_id, :user_id, :quantity
  json.url hitcher_like_url(hitcher_like, format: :json)
end

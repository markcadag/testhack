json.array!(@feeds) do |feed|
  json.extract! feed, :id, :user_id, :topic_id, :title
  json.url feed_url(feed, format: :json)
end

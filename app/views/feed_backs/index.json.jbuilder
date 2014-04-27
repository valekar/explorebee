json.array!(@feed_backs) do |feed_back|
  json.extract! feed_back, :email, :subject, :content
  json.url feed_back_url(feed_back, format: :json)
end
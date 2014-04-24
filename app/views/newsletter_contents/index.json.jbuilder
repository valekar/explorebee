json.array!(@newsletter_contents) do |newsletter_content|
  json.extract! newsletter_content, :name, :description
  json.url newsletter_content_url(newsletter_content, format: :json)
end
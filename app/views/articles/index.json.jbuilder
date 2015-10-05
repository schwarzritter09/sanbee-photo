json.array!(@articles) do |article|
  json.extract! article, :id, :message, :close_flag, :user_id, :member_id
  json.url article_url(article, format: :json)
end

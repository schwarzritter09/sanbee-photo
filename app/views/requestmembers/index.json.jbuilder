json.array!(@requestmembers) do |requestmember|
  json.extract! requestmember, :id, :article_id, :member_id
  json.url requestmember_url(requestmember, format: :json)
end

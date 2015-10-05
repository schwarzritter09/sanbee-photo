json.array!(@members) do |member|
  json.extract! member, :id, :name, :unit_id
  json.url member_url(member, format: :json)
end

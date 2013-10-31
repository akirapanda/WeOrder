json.array!(@goods) do |good|
  json.extract! good, :cover, :name, :content, :price, :unit
  json.url good_url(good, format: :json)
end

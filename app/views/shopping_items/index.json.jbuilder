json.array!(@shopping_items) do |shopping_item|
  json.extract! shopping_item, :good_id, :shopping_id, :count, :amount
  json.url shopping_item_url(shopping_item, format: :json)
end

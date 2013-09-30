json.array!(@goods_items) do |goods_item|
  json.extract! goods_item, :good_id, :order_id
  json.url goods_item_url(goods_item, format: :json)
end

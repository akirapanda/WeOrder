json.array!(@shoppings) do |shopping|
  json.extract! shopping, :customer_name, :customer_address, :amount
  json.url shopping_url(shopping, format: :json)
end

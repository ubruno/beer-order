json.array!(@beers) do |beer|
  json.extract! beer, :id, :name, :description, :style, :bootle_size, :price, :maximum_order_amount, :available_quantity
  json.url beer_url(beer, format: :json)
end

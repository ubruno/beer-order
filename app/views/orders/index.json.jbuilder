json.array!(@orders) do |order|
  json.extract! order, :id, :customer_name, :email, :phone_number, :delivery_address, :quantity, :status, :beer
  json.url order_url(order, format: :json)
end

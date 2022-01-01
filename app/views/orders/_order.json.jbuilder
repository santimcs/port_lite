json.extract! order, :id, :trade, :name, :qty, :price, :amount, :active, :created_at, :updated_at
json.url order_url(order, format: :json)

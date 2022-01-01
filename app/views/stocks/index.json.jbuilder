json.array!(@stocks) do |stock|
  json.extract! stock, :id, :name, :url, :buy_percent, :sell_percent
  json.url stock_url(stock, format: :json)
end

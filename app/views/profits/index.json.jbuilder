json.array!(@profits) do |profit|
  json.extract! profit, :id, :name, :quarter, :latest_profit, :previous_profit, :inc_profit, :inc_percent
  json.url profit_url(profit, format: :json)
end

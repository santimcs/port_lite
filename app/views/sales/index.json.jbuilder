json.array!(@sales) do |sale|
  json.extract! sale, :id, :name, :fm_date, :to_date, :days, :fm_price, :to_price, :diff, :pct, :ttl_spread, :avg_spread, :qty
  json.url sale_url(sale, format: :json)
end

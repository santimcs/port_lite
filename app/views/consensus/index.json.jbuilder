json.array!(@consensus) do |consensu|
  json.extract! consensu, :id, :name, :price, :buy, :hold, :sell, :eps_a, :eps_b, :pe, :pbv, :yield, :target_price, :status
  json.url consensu_url(consensu, format: :json)
end

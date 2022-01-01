json.array!(@latest_dates) do |latest_date|
  json.extract! latest_date, :id, :date
  json.url latest_date_url(latest_date, format: :json)
end

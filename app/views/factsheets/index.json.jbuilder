json.array!(@factsheets) do |factsheet|
  json.extract! factsheet, :id, :name, :item, :figure1, :figure2, :figure3, :figure4
  json.url factsheet_url(factsheet, format: :json)
end

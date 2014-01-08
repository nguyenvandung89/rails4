json.array!(@categories) do |category|
  json.extract! category, :id, :name, :start_date
  json.url category_url(category, format: :json)
end

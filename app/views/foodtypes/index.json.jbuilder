json.array!(@foodtypes) do |foodtype|
  json.extract! foodtype, :id, :name
  json.url foodtype_url(foodtype, format: :json)
end

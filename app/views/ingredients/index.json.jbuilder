json.array!(@ingredients) do |ingredient|
  json.extract! ingredient, :id, :name, :number_of_people, :metric_unit, :imperial_unit, :caters_for_qty
  json.url ingredient_url(ingredient, format: :json)
end

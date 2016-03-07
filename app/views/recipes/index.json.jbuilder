json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :product_id, :sequence, :time_before_meal, :instructions, :image
  json.url recipe_url(recipe, format: :json)
end

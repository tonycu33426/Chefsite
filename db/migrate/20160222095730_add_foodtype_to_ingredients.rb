class AddFoodtypeToIngredients < ActiveRecord::Migration
  def change
      foodtype = Foodtype.create! name: "No Food Type"
      add_reference :ingredients, :foodtype, index: true, default: foodtype.id
  end
end

class AddQtyToIngredients < ActiveRecord::Migration
  def change
    add_column :ingredients, :metric_qty, :decimal
    add_column :ingredients, :imperial_qty, :decimal
  end
end

class CreateProductIngredients < ActiveRecord::Migration
  def change
    create_table :product_ingredients do |t|
      t.references :product, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true
      t.decimal :metric_qty
      t.decimal :imperial_qty
      t.decimal :metric_pack_size
      t.decimal :imperial_pack_size
      t.string :metric_unit
      t.string :imperial_unit

      t.timestamps null: false
    end
  end
end

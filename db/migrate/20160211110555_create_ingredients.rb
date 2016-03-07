class CreateIngredients < ActiveRecord::Migration
  def change
    create_table :ingredients do |t|
      t.string :name
      t.integer :number_of_people
      t.string :metric_unit
      t.string :imperial_unit
      t.integer :caters_for_qty

      t.timestamps null: false
    end
  end
end

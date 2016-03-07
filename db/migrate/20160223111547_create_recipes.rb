class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.references :product, index: true, foreign_key: true
      t.integer :sequence
      t.decimal :time_before_meal
      t.string :instructions
      t.string :image

      t.timestamps null: false
    end
  end
end

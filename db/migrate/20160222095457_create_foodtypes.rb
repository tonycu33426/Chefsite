class CreateFoodtypes < ActiveRecord::Migration
  def change
    create_table :foodtypes do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end

class DropColumns < ActiveRecord::Migration
  def change
      remove_column :ingredients, :number_of_people
      remove_column :ingredients, :caters_for_qty
  end
end

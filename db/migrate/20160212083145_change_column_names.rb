class ChangeColumnNames < ActiveRecord::Migration
  def change
      rename_column :ingredients, :metric_qty, :metric_pack_size
      rename_column :ingredients, :imperial_qty, :imperial_pack_size
  end
end

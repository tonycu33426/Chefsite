class AddFieldsToOrder < ActiveRecord::Migration
  def change
    add_column :orders, :event_name, :string
    add_column :orders, :event_date, :date
    add_column :orders, :event_time, :time
    add_column :orders, :invite_template, :integer
    add_column :orders, :invite_words, :string
    add_column :orders, :feedback_date, :date
    add_column :orders, :feedback_text, :string
  end
end

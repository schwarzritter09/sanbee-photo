class AddColumnsToArticles < ActiveRecord::Migration
  def change
    add_column :articles, :trading_flag, :boolean
    add_column :articles, :memo, :string
  end
end

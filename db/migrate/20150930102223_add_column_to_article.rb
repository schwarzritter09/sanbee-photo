class AddColumnToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :obverse_photo, :binary
    add_column :articles, :reverse_photo, :binary
  end
end

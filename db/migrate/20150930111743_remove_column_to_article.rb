class RemoveColumnToArticle < ActiveRecord::Migration
  def change
    remove_column :articles, :obverse_photo, :binary
    remove_column :articles, :reverse_photo, :binary
  end
end

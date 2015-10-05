class AddColumn2ToArticle < ActiveRecord::Migration
  def change
    add_column :articles, :obverse_photo, :string
    add_column :articles, :reverse_photo, :string
  end
end

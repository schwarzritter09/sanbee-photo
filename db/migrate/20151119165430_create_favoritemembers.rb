class CreateFavoritemembers < ActiveRecord::Migration
  def change
    create_table :favoritemembers do |t|
      t.integer :user_id
      t.integer :member_id

      t.timestamps null: false
    end
  end
end

class CreateArticles < ActiveRecord::Migration
  def change
    create_table :articles do |t|
      t.string :message
      t.boolean :close_flag
      t.integer :user_id
      t.integer :member_id

      t.timestamps null: false
    end
  end
end

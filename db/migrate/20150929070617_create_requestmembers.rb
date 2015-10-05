class CreateRequestmembers < ActiveRecord::Migration
  def change
    create_table :requestmembers do |t|
      t.integer :article_id
      t.integer :member_id

      t.timestamps null: false
    end
  end
end

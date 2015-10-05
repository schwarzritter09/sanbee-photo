class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
      t.string :provider
      t.string :uid
      t.string :username

      t.timestamps null: false

    end

    add_index :users, [:provider, :uid], unique: true
  end
end

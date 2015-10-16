class AddColumnsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :admin_flag, :boolean
  end
end

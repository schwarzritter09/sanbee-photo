class AddColumnToMembers < ActiveRecord::Migration
  def change
    add_column :members, :kana, :string
  end
end

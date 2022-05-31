class RenameColumnForUsers < ActiveRecord::Migration[7.0]
  def up
    rename_column :users, :name, :first_name
  end

  def down
    rename_column :users, :name, :string
  end
end

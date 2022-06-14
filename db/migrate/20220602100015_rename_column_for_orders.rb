class RenameColumnForOrders < ActiveRecord::Migration[7.0]
  def change
    rename_column :orders, :user_id, :telegram_user_id
  end
end

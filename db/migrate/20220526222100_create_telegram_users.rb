class CreateTelegramUsers < ActiveRecord::Migration[7.0]
  def change
    create_table :telegram_users do |t|
      t.string :first_name
      t.string :username
      t.integer :tg_chat_id

      t.timestamps
    end
  end
end

class CreateMessages < ActiveRecord::Migration[7.0]
  def change
    create_table :messages do |t|
      t.text :body
      t.integer :tg_chat_id
      t.references :author, polymorphic: true

      t.timestamps
    end
  end
end

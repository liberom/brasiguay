class AddReadAtToMessages < ActiveRecord::Migration[7.1]
  def change
    add_column :messages, :read_at, :datetime, null: true
    add_index :messages, [:receiver_id, :read_at], name: 'index_messages_receiver_read'
  end
end

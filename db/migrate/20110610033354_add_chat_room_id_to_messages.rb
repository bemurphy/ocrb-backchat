class AddChatRoomIdToMessages < ActiveRecord::Migration
  def self.up
    add_column :messages, :chat_room_id, :integer
  end

  def self.down
    remove_column :messages, :chat_room_id
  end
end

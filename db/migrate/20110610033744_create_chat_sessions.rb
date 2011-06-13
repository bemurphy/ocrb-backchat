class CreateChatSessions < ActiveRecord::Migration
  def self.up
    create_table :chat_sessions do |t|
      t.integer :user_id
      t.integer :chat_room_id

      t.timestamps
    end
  end

  def self.down
    drop_table :chat_sessions
  end
end

class ChatRoom < ActiveRecord::Base
  has_many :messages
  has_many :chat_sessions
  has_many :users, :through => :chat_sessions, :readonly => true
end

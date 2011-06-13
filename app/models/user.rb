class User < ActiveRecord::Base
  has_many :messages
  has_many :chat_sessions
  has_many :chat_rooms, :through  => :chat_sessions, :readonly => true
end

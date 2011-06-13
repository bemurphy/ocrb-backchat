class Message < ActiveRecord::Base
  belongs_to :user
  belongs_to :chat_room

  validates_presence_of :user, :chat_room

  after_create :push

  protected

  def push
    Pusher['chat'].trigger('message', attributes.merge(:username => user.name))
  end
end

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
  #chat 이랑 1:N
  has_many :chats
  #chat_room 과 M:N
  has_many :admissions
  has_many :chat_rooms, through: :admissions

  def join_room?(chatroom)
    # Admission.where(user_id: self.id, chat_room_id: chatroom.id)
    self.chat_rooms.include?(chatroom)
  end
end

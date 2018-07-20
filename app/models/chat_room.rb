class ChatRoom < ActiveRecord::Base
  # chat과 1:N 관계
  has_many :chats
  # user와 M:N 관계
  has_many :user, through: :admissions
  has_many :admissions

  after_commit :create_chat_room_notification, on: :create
  #생성하는 commit이 발생했을 때에만 after_commit 메소드가 실행

  def create_chat_room_notification
    #Pusher.trigger(채널명, 이벤트명, 정보 json)
    Pusher.trigger('chat_room', 'create', self.as_json)
  end
end

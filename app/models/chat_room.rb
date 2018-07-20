class ChatRoom < ActiveRecord::Base
  # chat과 1:N 관계
  has_many :chats
  # user와 M:N 관계
  has_many :user, through: :admissions
  has_many :admissions
end

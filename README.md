`rails _4.2.10_ new chatservice` 버전 명시

`figaro install`

`rails g devise:install`

`rails g devise users`



채팅  Model

- 채팅방 : 채팅내용 (1:N)
  - `rails g scaffold chat_room title master_id max_count:integer admission_count:integer`
  - `rails g model chat user:references chat_room:references message:text`
- 채팅방: 사람(M:N)
  - `rails g model admission user:references chat_room:references`
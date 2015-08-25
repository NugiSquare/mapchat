class ChatController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
    #controller_store[:message_count] = 0
  end
  
  def echo #중계
    receive_message = message()
    h = receive_message.parse()
    m = Hash.new
    m["channel_id"] = h["channel_id"]
    m["content"] = h["content"]
    m["username"] = current_user.username
    
    ChatLog.create(user_id: current_user.id, channel_id: h["channel_id"], msg: h["content"])
    
    broadcast_message(:chat, m)
  end
  
end
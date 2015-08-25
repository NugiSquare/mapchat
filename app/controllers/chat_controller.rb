class ChatController < WebsocketRails::BaseController
  def initialize_session
    # perform application setup here
    controller_store[:message_count] = 0
  end
  
  def echo
    receive_message = message()
    broadcast_message(:echo, receive_message)
  end
end
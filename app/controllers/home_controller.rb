class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:chat, :create_chat]
  def index
    @channels = Channel.where(is_valid: true)
  end
  
  def chat
    @channel = Channel.find(params[:channel_id])
    
    unless @channel.nil?
      
    end
  end
  
  #채팅생성
  def create_chat
    id_channel = Channel.create(user_id: current_user.id,
                                title: params[:title],
                                lat: params[:lat],
                                lng: params[:lng],
                                is_valid: true).id
    
    redirect_to '/chat/'+id_channel.to_s
  end
  
  #채팅방지움 어떻게 할 까 사람없을 때 지운게 짱인데
  def destroy_chat
    chatroom = Channel.find(params[:id]) #채널아이디 받아서 is_valid false로
    chatroom.is_valid = false
    redirect_to '/'
  end
end

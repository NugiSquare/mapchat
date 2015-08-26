class HomeController < ApplicationController
  before_action :authenticate_user!, only: [:chat, :create_chat]
  def index
    @channels = Channel.where(is_valid: true)
    @url = request.host+':'+request.port.to_s
  end
  
  def chat
    @channel = Channel.find(params[:channel_id])
    @url = request.host+':'+request.port.to_s
    if @channel.nil?
      render text: "채팅방이 없어졌습니다..."
    end
    render layout: false
  end
  
  #채팅생성
  def create_chat
    id_channel = Channel.create(user_id: current_user.id,
                                title: params[:title],
                                lat: params[:lat],
                                lng: params[:lng],
                                is_valid: true).id
    flash[:open_chat] = id_channel
    redirect_to '/'
  end
  
  #채팅방지움 어떻게 할 까 사람없을 때 지운게 짱인데
  def destroy_chat
    chatroom = Channel.find(params[:id])
    if chatroom.user_id == current_user.id
      chatroom.is_valid = false
      flash[:closed] = chatroom.save
    else
      flash[:alert] = "방은 방장만 지울 수 있습니다"
    end
    redirect_to :back
  end

end

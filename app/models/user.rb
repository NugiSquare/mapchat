class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :recoverable, :rememberable, :trackable, :validatable
  #유저는 여러채널에 속해있음
  # has_and_belongs_to_many :channels
  has_one :channel # 방장이 하나의 채널을 가짐: 정인수
end

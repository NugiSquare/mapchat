class Channel < ActiveRecord::Base
    
    # has_and_belongs_to_many :users #채널에 여러 유저들
    belongs_to :user # 방장에게 종속 :정인수
end

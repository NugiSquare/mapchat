class CreateChannels < ActiveRecord::Migration
  #Channel
  def change
    create_table :channels do |t|
      t.integer :user_id, null: false #방장
      t.string :title, null: false #방의 이름
      
      #구글맵의 좌표 : 김우정
      t.string :lat, null: false
      t.string :lng, null: false
      
      t.boolean :is_valid, null: false, default: true
      
      t.timestamps null: true #개설시간
      # id는 기본적으로 생성된 id
    end
  end
end

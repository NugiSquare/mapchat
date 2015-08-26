############################# 회원 DB json에서 가져오는 부분 ###################################
Channel.create(user_id: 1, title: "전체방", lat: "37", lng: "132")

@data_hash = Hash.new
path=Rails.root.to_s

file = File.read(path+'/app/controllers/userdb1.json')
@data_hash = JSON.parse(file)

for x in 0..537
   u = User.new(
              :email => @data_hash["user_list"][x]["email"].to_s,
              :username => @data_hash["user_list"][x]["name"].to_s,
              :encrypted_password => @data_hash["user_list"][x]["password"].to_s,
              :univ => @data_hash["user_list"][x]["school"].to_s       
               )
    u.save!(:validate => false)
end

# 전체 채팅방

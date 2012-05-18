class User < ActiveRecord::Base
  def self.create_with_omniauth(auth)
    create! do |user|
      user.uid = auth["uid"]
      user.fname = auth["info"]["name"]
      user.lname = ""
      user.email = ""
      user.handle = auth["extra"]["raw_info"]["login"]
    end
  end
end

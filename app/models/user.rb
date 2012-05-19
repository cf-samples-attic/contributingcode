class User < ActiveRecord::Base
  class << self 

    # Create user with github info 
    def create_with_omniauth(auth)
      create! do |user|
        user.uid = auth["uid"]
        user.name = auth["info"]["name"]
        user.email = ""
        user.handle = auth["extra"]["raw_info"]["login"]
      end
    end

    # Update user info after registering 
    def update_info(params, current_user)
      user = current_user
      user.name = params[:name]
      user.email = params[:email]
      if user.save
        #return
        return {:err => nil, :data => user}
      else 
        # else
        return {:err => "e2", :data => nil}
      end 
    end 

  end
end

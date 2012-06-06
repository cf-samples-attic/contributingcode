class User < ActiveRecord::Base
  has_one :team_member
  has_many :join_requests
  has_one :owned_team, :foreign_key => 'owner_id', :class_name => 'Team'
  has_one :team, :through => :team_member


  validates_presence_of   :email , :message => "Email required!"
  validates_uniqueness_of :email
  validates_format_of     :email, :with => %r{.+@.+\..+}

  class << self 

    # Create user with github info 
    def create_with_omniauth(auth)
      user = User.new 
      user.uid = auth["uid"]
      user.name = auth["info"]["name"]
      user.email = ""
      user.handle = auth["extra"]["raw_info"]["login"]
      user.token = Digest::SHA1.hexdigest([Time.now, rand].join).slice(0..6)
      user.save(:validate => false)
      return user 
    end

    # Update user info after registering 
    def update_info(params)
      return {:err => "e1", :data => "Invalid"} if params[:token].blank?
      user = User.find_by_token(params[:token])
      return {:err => "e1", :data => "No such user"} if user.blank?
      user.name = params[:name]
      user.email = params[:email]
      if user.save
        #return
        return {:err => nil, :data => user}
      else 
        # else
        puts "-----------------------"
        puts user.errors[0].to_s.inspect
        return {:err => user.errors[0], :data => user}
      end 
    end 

  end
end

class HomeController < ApplicationController


  def index 
  end
   
  def update_user
    user = User.update_info(params, current_user)
    redirect_to root_url
  end 

end

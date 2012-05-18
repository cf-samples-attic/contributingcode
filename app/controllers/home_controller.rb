class HomeController < ApplicationController

  def update_user
    user = User.update_info(params, current_user)
    redirect_to root_url
  end 

end

class SessionsController < ApplicationController

  # callback form github 
  # Create user for first time
  # Redirect to registration form unless email is filled 
  # Session is not created unless user has email 
  def create
    auth = request.env["omniauth.auth"]
    @user = User.find_by_uid(auth["uid"]) || User.create_with_omniauth(auth)
    if @user.email.present? 
      session[:user_id] = @user.id
      redirect_to root_url, :notice => "Signed in!" 
    end
  end
   
  def failure
    render :text => "Failed!"
  end

  # logout 
  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Signed out!"
  end

end
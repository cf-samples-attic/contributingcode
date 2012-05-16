class SessionsController < ApplicationController

  def new
  end

  def create
    render :text => "<pre>"+request.env["omniauth.auth"].to_yaml+"</pre>"
  end

  def failure
    render :text => "Failed!"
  end

end

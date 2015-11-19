class WelcomeController < ApplicationController
  def index
    if :user_id == nil
      redirect_to "/signin"
    end
  	@user = User.find session[:user_id]
  end

  def signout
    if session[:user_logged]
      session[:user_logged] = false
      session[:user_id] = nil
    end

    redirect_to "/home/signin"
  end

  def home
    if signed_in? == true
      redirect_to "/rpg/index"
    end
  end

  

  
end

class SessionsController < ApplicationController

  def new
    if signed_in? == true
      redirect_to "/rpg/index"
    end
  end

  def create
    redirect_to "/rpg/index" if session[:user_logged]

    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to "/rpg/index"
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

  
  def destroy
    sign_out
    redirect_to root_url
  end
end
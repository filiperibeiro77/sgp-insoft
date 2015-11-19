class RpgController < ApplicationController

	def index
		if session[:user_logged] == false
			redirect_to "/signin"
		end

		redirect_to "/rpg/loja"
	end

	def logout
    if session[:user_logged]
      session[:user_logged] = false
      session[:user_id] = nil
    end

    redirect_to "/signin"
  end
  
  def show
  end

end

class UsersController < ApplicationController


  def show
    @user = User.find(params[:id])
  end

  def new
  	@user = User.new
  end

    def update
    @user = User.find(params[:id])
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end
  
  def create
    @user = User.new(user_params)
    @user.is_admin = false
      respond_to do |format|
      if @user.save
        format.html { redirect_to root_path, notice: 'Funcionário criado com sucesso.' }
        format.json { render :show, status: :created, location: root_path}
      else
        format.html { render :new }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @user = User.find(params[:id])
  end
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
  

end

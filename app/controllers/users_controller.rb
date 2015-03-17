class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    direct_correct_user
  end
  
  def create
    @user = User.new(user_params)    # Not the final implementation!
    if @user.save
      log_in @user
      redirect_to user_url(@user)
      flash[:success] = "Welcome to Teas on the Loose!"

    else
      render 'new'
    end
  end
  
  def update
    direct_correct_user
    if @user.update_attributes(user_params)
      flash[:success] = "Profile updated"
      redirect_to @user
    else
      render 'edit'
    end
  end

  
  def edit
    direct_correct_user
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
    
    def direct_correct_user
      if !logged_in?
      redirect_to login_path
      end
    
      if logged_in? && !get_current_user.nil?
        @user = get_current_user
      elsif logged_in?
        @user = User.find(params[:id]) 
      end
    end
      
  
end

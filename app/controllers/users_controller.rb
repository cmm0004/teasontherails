class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def show
    if !logged_in?
      redirect_to root_path
    end
    
    if logged_in? && !get_current_user.nil?
      @user = get_current_user
    elsif logged_in?
      @user = User.find(params[:id]) 
    end
  
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
  
  def edit
    if !logged_in?
      redirect_to root_path
    end
    
    if logged_in? && !get_current_user.nil?
      @user = get_current_user
    elsif logged_in?
      @user = User.find(params[:id]) 
    end
  end
  
  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
                                   :password_confirmation)
    end
  
end

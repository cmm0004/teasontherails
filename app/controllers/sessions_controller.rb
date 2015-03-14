class SessionsController < ApplicationController
  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      log_in(user)
      params[:session][:remember_me] == '1' ? remember(user) : forget(user)
      redirect_to user
    else
      flash.now[:danger] = "Invalid Login Credentials"
      render 'new'
    end
  end

  def destroy
    if logged_in?
      @current_user = get_current_user
      forget(@current_user)
      session.delete(:user_id)
      @current_user = nil
    end
      redirect_to root_path
  end
end
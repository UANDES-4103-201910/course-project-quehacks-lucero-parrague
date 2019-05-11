class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: session_params[:email], password: session_params[:password])
    if user
      cookies[:user_id] = user.id
      flash[:notice] = "Login success"
      log_in user
      redirect_to root_path
    else
      flash.now[:danger] = "Invalid email/password combination"
      redirect_to login_path
    end
  end

  def destroy
    log_out
    redirect_to root_path
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end

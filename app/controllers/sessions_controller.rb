class SessionsController < ApplicationController
  def new

  end

  def create
    user = User.find_by(email: session_params[:email], password: session_params[:password])
    if user
      cookies[:user_id] = user.id
      flash[:notice] = "Login success"
      log_in user
      redirect_to "/users/" +String(user.id)
    else
      flash.now[:danger] = "Invalid email/password combination"
      redirect_to root_path
    end
  end

  def destroy
    #complete this method
    log_out
    redirect_to root_path
  end

  def session_params
    params.require(:session).permit(:email, :password)
  end
end
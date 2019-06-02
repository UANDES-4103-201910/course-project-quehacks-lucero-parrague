class ApplicationController < ActionController::Base
  before_action :set_posts
  before_action :authenticate_user!, :configure_permitted_parameters, if: :devise_controller?


  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:display_name, :name, :id])
  end

  def set_posts
    @posts = Post.all
  end

end

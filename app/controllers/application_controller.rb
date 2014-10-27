class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

private

  def current_user
    @current_user ||= User.find_by_id session[:current_user]
  end
  helper_method :current_user

  def signed_in?
    current_user.present?
  end
  helper_method :signed_in?

  def sign_in(user)
    session[:current_user] = user.id
  end

  def sign_out
    session.delete(:current_user)
  end
end

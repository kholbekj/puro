class SessionsController < ApplicationController
  def create
    user = User.authorize_or_create(auth_hash)

    if user
      sign_in(user)
    else
      flash[:error] = 'Could not sign in'
    end

    redirect_to(root_path)
  end

  def destroy
    sign_out and redirect_to(root_path)
  end

private

  def auth_hash
    request.env['omniauth.auth']
  end
end

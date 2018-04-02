class SessionsController < ApplicationController
  skip_before_action :authorize

  def omniauth
    username = auth_hash['info']['name']
    user = RedditUser.find_or_create_by(username: username)
    session[:user_id] = user.id
    redirect_to root_url, notice: "logged in"
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end

  def failure
    redirect_to root_url, alert: "authentication failed"
  end

  private

    def auth_hash
      request.env['omniauth.auth']
    end

end

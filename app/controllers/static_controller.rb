class StaticController < ApplicationController

  skip_before_action :authorize, only: :home

  def home
    redirect_to tournaments_path if current_user
  end
end

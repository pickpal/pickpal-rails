class StaticController < ApplicationController

  skip_before_action :authorize, only: :home

  def home
  end
end

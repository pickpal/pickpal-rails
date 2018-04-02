class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.roots
  end

  def show
    @tournament = Tournament.includes(fights: :fighters).find(params[:id])
  end
end

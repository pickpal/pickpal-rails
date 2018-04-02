class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.roots
  end

  def show
    @tournament = Tournament.find(params[:id])
    @sub_tournaments = @tournament.descendants.includes(fights: :fighters)
  end
end

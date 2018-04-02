class TournamentsController < ApplicationController
  def index
    @tournaments = Tournament.roots
  end

  def show
    @tournament = Tournament.find(params[:id])
    @sub_tournaments = @tournament.descendants.includes(fights: [:fighters, :match_competitors], matches: [])
    @picks = current_user.picks.where(match: @sub_tournaments.flat_map{ |t| t.matches.ids }.uniq)
  end
end

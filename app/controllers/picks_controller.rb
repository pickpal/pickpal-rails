class PicksController < ApplicationController
  def create
    @pick = current_user.picks.new(pick_params)
    if @pick.save
      redirect_back(fallback_location: @pick.match, notice: 'done')
    else
      redirect_back(fallback_location: @pick.match, alert: 'problem')
    end
  end

  def update
    @pick = current_user.picks.find(params[:id])
    return destroy if nothing_selected?
    if @pick.update(pick_params)
      redirect_back(fallback_location: @pick.match, notice: 'done')
    else
      redirect_back(fallback_location: @pick.match, alert: 'problem')
    end
  end

  def destroy
    @pick.destroy
    redirect_back(fallback_location: @pick.match, notice: 'destroyed')
  end

  private

    def nothing_selected?
      return pick_params['match_competitor_id'] == 'false'
    end

    def pick_params
      params.require(:pick).permit!
    end
end

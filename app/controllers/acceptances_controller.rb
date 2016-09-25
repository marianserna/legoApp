class AcceptancesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_challenge
  before_action :ensure_can_accept
  
  def new
    # Shows form
  end

  def create
    # acceptance_params = challengee_time
    if @challenge.update(acceptance_params)
      @challenge.complete!
      @challenge.winner.add_points(@challenge.points)
      if @challenge.challenger == @challenge.winner
        Alert.create(user: @challenge.challenger, challenge: @challenge, alert_type: 'won' )
      else
        Alert.create(user: @challenge.challenger, challenge: @challenge, alert_type: 'lost' )
      end
      redirect_to user_url(current_user)
    else
      render :new
    end
  end

  private

  def find_challenge
     @challenge = Challenge.find(params[:challenge_id])
  end

  def ensure_can_accept
    unless @challenge.can_accept_or_decline?(current_user)
      redirect_to user_url(current_user)
    end
  end

  def acceptance_params
    params.require(:challenge).permit(:challengee_time)
  end

end

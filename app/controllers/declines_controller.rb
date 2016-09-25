class DeclinesController < ApplicationController

  before_action :authenticate_user!
  before_action :find_challenge
  before_action :ensure_can_decline

  def create
    @challenge.decline!
    @challenge.winner.add_points(@challenge.points)
    Alert.create(user: @challenge.challenger, challenge: @challenge, alert_type: 'declined' )
    redirect_to user_url(current_user)
  end

  private

  def find_challenge
     @challenge = Challenge.find(params[:challenge_id])
  end

  def ensure_can_decline
    unless @challenge.can_accept_or_decline?(current_user)
      redirect_to user_url(current_user)
    end
  end

end

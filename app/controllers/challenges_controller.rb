class ChallengesController < ApplicationController

  before_action :authenticate_user!

  def new
    @challenge = Challenge.new
    @challenge.challenger = current_user
    @challenge.challengee = User.find(params[:user_id])
    if @challenge.save!
      redirect_to @challenge
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
    unless @challenge.participant?(current_user)
      redirect_to root_url
    end
  end

  def complete

  end

  def decline

  end

  private

  def challenge_params
    params.require(:challenge).permit(:challengee_id, :challenger_time)
  end

end

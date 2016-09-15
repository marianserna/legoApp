class ChallengesController < ApplicationController

  def new
    @challenge = Challenge.new
  end

  def create
    @challenge = Challenge.new(challenge_params)
    if @challenge.save
      redirect_to @challenge
    else
      render "new"
    end
  end

  def show
    @challenge = Challenge.find(params[:id])
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

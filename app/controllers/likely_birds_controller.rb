class LikelyBirdsController < ApplicationController

  def index
    likely_birds = LikelyBird.where(checklist_id: params[:checklist_id])
    render json: likely_birds
  end

  def update
    likely_bird = LikelyBird.find(params[:id])
    likely_bird.has_seen = !likely_bird.has_seen
    likely_bird.save
    render json: likely_bird
  end

end

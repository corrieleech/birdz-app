class LikelyBirdsController < ApplicationController

  def index
    likely_birds = LikelyBird.where(checklist_id: params[:checklist_id])
    render json: likely_birds
  end

  def create
    bird_seen = LikelyBird.new(
      checklist_id: params[:checklist_id],
      bird_id: params[:bird_id],
      has_seen: true
    )
    if bird_seen.save
      render json: bird_seen
    else
      render json: { errors: bird_seen.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
  def update
    likely_bird = LikelyBird.find(params[:id])
    likely_bird.has_seen = !likely_bird.has_seen
    likely_bird.save
    render json: likely_bird
  end

end

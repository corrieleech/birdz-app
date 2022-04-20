class LikelyBirdsController < ApplicationController

  def index
    likely_birds = LikelyBird.where(checklist_id: params[:checklist_id])
    render json: likely_birds
  end

  def create
    #birds_from_api = THIS IS WHERE API HIT GOES
    
    birds_from_api.each do
  
      bird = LikelyBird.new(
        checklist_id: 1, 

      )
    end
  end

  def update
    likely_bird = LikelyBird.find(params[:id])
    likely_bird.has_seen = !likely_bird.has_seen
    likely_bird.save
    render json: likely_bird
  end

end

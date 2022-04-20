class HotspotsController < ApplicationController
  def index
    hotspots = HTTP.headers("x-ebirdapitoken" => Rails.application.credentials.ebird.api_key).get("https://api.ebird.org/v2/ref/hotspot/#{params[:region]}/?fmt=json").parse(:json)
    render json: hotspots
  end
  
end

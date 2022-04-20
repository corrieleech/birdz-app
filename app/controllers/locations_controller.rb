class LocationsController < ApplicationController

  def index
    locations = HTTP.headers("x-ebirdapitoken" => Rails.application.credentials.ebird.api_key).get("https://api.ebird.org/v2/ref/region/list/subnational2/US-#{params[:state]}").parse(:json)
    render json: locations
  end
  
end

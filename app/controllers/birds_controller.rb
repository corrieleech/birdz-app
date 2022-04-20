class BirdsController < ApplicationController

  def show
    bird = HTTP.headers("x-ebirdapitoken" => Rails.application.credentials.ebird.api_key).get("https://api.ebird.org/v2/ref/taxonomy/ebird?species=#{params[:speciesCode]}&fmt=json").parse(:json)
    render json: bird
  end

end

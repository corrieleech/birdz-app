class SightingsController < ApplicationController

  def index
    sightings = HTTP.headers("x-ebirdapitoken" => Rails.application.credentials.ebird.api_key).get("https://api.ebird.org/v2/data/obs/#{params[:location]}/recent").parse(:json)
    render json: sightings
  end

  def location
    historic = HTTP.headers("x-ebirdapitoken" => Rails.application.credentials.ebird.api_key).get("https://api.ebird.org/v2/data/obs/#{params[:hotspot]}/historic/#{params[:year]}/#{params[:month]}/#{params[:day]}/").parse(:json)
    render json: historic
  end

  def sighting_time
    #sightings within 2 hours of entered time
    timely_sightings = []
    user_time = DateTime.new(params[:year].to_i, params[:month].to_i, params[:day].to_i, params[:hour].to_i, params[:minute].to_i)
    sightings = HTTP.headers("x-ebirdapitoken" => Rails.application.credentials.ebird.api_key).get("https://api.ebird.org/v2/data/obs/#{params[:location]}/recent").parse(:json)
    sightings.each do |sighting|
      sighting_time = sighting["obsDt"].to_datetime
      if user_time - 1.hour < sighting_time && user_time + 1 > sighting_time
        timely_sightings << sighting
      end
    end
    render json: timely_sightings
  end

  def possible_sightings
    #method takes in a user date and pulls historic bird observation data for the week before and the week after and returns possible sightings if they're within 1 hour +/- of the entered time

    possible_sightings = []
    user_date = DateTime.new(params[:year].to_i, params[:month].to_i, params[:day].to_i, params[:hour].to_i, params[:minute].to_i)
    user_date = user_date - 7.days

    14.times do
      day_sightings = HTTP.headers("x-ebirdapitoken" => Rails.application.credentials.ebird.api_key).get("https://api.ebird.org/v2/data/obs/#{params[:hotspot]}/historic/#{user_date.year}/#{user_date.month}/#{user_date.day}/").parse(:json)
      day_sightings.each do |sighting|
        sighting_time = sighting["obsDt"].to_datetime
        if sighting_time > user_date - 1.hour && sighting_time < user_date + 1.hour
          possible_sightings << sighting
        end
      end
      user_date += 1.days
    end
    render json: possible_sightings
  end

end

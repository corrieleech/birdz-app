Rails.application.routes.draw do
  get "sightings" => "sightings#index"
  get "locations" => "sightings#locations"
  get "hotspots" => "sightings#hotspots"
  get "historic" => "sightings#historic_montrose"
  get "time" => "sightings#sighting_time"
  get "historic-time" => "sightings#historic_time"

end

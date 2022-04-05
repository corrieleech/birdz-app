Rails.application.routes.draw do
  post "/users" => "users#create"
  post "/sessions" => "sessions#create"
  
  #test routes, will be turned RESTful
  get "sightings" => "sightings#index"
  get "locations" => "sightings#locations"
  get "hotspots" => "sightings#hotspots"
  get "location" => "sightings#historic_montrose"
  get "time" => "sightings#sighting_time"
  get "historic" => "sightings#historic_data"
  get "historic-time" => "sightings#historic_time"
  get "bird" => "sightings#bird_tax"

end

Rails.application.routes.draw do
  post "/users" => "users#create"
  get "/users/:id" => "users#show"
  patch "/users/:id" => "users#update"
  delete "/users/:id" => "users#destroy"

  post "/sessions" => "sessions#create"
  
  get "/checklists" => "checklists#index"
  post "/checklists" => "checklists#create"
  get "/checklists/:id" => "checklists#show"
  delete "/checklists/:id" => "checklists#destroy"

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

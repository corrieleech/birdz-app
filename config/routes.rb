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

  get "/likely-birds" => "likely_birds#index"
  post "/likely-birds" => "likely_birds#create"
  patch "/likely-birds/:id" => "likely_birds#update"

  get "/locations" => "locations#index"
  get "/hotspots" => "hotspots#index"

  get "/birds" => "birds#index"
  get "/birds/:speciesCode" => "birds#show"

  #test routes, will be turned RESTful
  get "sightings" => "sightings#index"
  get "location" => "sightings#historic_montrose"
  get "time" => "sightings#sighting_time"
  get "historic" => "sightings#historic_data"
  get "possible-sightings" => "sightings#possible_sightings"

end

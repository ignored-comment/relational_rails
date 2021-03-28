Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/garages', to: 'garages#index'
  get '/garages/new', to: 'garages#new' #TODO Ask Question 'bout dis
  post '/garages', to: 'garages#create'
  get '/garages/:id', to: 'garages#show'
  get '/garages/:id/motorcycles',
    to: 'garages#index_motorcycles_in_garage',
    as: 'motorcycles_in_this_garage'

  get '/motorcycles', to: 'motorcycles#index'
  get '/motorcycles/:id', to: 'motorcycles#show'

  get '/refrigerators', to: 'refrigerators#index'
  get '/refrigerators/new', to: 'refrigerators#new'
  post '/refrigerators', to: 'refrigerators#create'
  get '/refrigerators/:id', to: 'refrigerators#show'
  get '/refrigerators/:id/foods',
    to: 'refrigerators#index_foods_in_refrigerator',
    as: 'foods_in_this_refrigerator'

  get '/foods', to: 'foods#index'
  get '/foods/:id', to: 'foods#show'
end

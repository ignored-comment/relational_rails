Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/garages', to: 'garages#index'
  get '/garages/new', to: 'garages#new'
  post '/garages', to: 'garages#create'
  get '/garages/:id/motorcycles/new', to: 'motorcycles#new', as: 'new_motorcycle'
  post '/garages/:id/motorcycles', to: 'motorcycles#create'
  get '/garages/:id', to: 'garages#show'
  delete '/garages/:id', to: 'garages#destroy'
  get 'garages/:id/edit', to: 'garages#edit', as: 'edit_this_garage'
  patch '/garages/:id', to: 'garages#update'

  get '/garages/:id/motorcycles',
  to: 'garages#index_motorcycles_in_garage',
  as: 'motorcycles_in_this_garage'
  patch '/garages/:id/motorcycles', to: 'garages#index_sorted_motorycles_in_garage', as: 'alphabetized_motorcycles'

  get '/motorcycles', to: 'motorcycles#index'
  get '/motorcycles/:id', to: 'motorcycles#show'
  get '/motorcycles/:id/edit', to: 'motorcycles#edit'
  patch '/motorcycles/:id', to: 'motorcycles#update'
  delete '/motorcycles/:id', to: 'motorcycles#destroy'

  get '/refrigerators', to: 'refrigerators#index'
  get '/refrigerators/new', to: 'refrigerators#new'
  post '/refrigerators', to: 'refrigerators#create'
  get '/refrigerators/:id/foods/new', to: 'foods#new', as: 'new_food'
  post '/refrigerators/:id/foods', to: 'foods#create'
  get '/refrigerators/:id', to: 'refrigerators#show'
  delete '/refrigerators/:id', to: 'refrigerators#destroy'
  get '/refrigerators/:id/edit', to: 'refrigerators#edit', as: 'edit_this_refrigerator'
  patch '/refrigerators/:id', to: 'refrigerators#update'

  get '/refrigerators/:id/foods',
    to: 'refrigerators#index_foods_in_refrigerator',
    as: 'foods_in_this_refrigerator'
  patch '/refrigerators/:id/foods', to: 'refrigerators#index_sorted_foods_in_refrigerator', as: 'alphabetized_foods'

  get '/foods', to: 'foods#index'
  get '/foods/:id', to: 'foods#show'
  get '/foods/:id/edit', to: 'foods#edit'
  patch '/foods/:id', to: 'foods#update'
  delete '/foods/:id', to: 'foods#destroy'
end

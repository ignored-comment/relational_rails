Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'

  get '/garages', to: 'garages#index'
  get '/garages/:id', to: 'garages#show'
  get '/garages/:id/motorcycles', to: 'garages#children'

  get '/motorcycles', to: 'motorcycles#index'
  get '/motorcycles/:id', to: 'motorcycles#show'

  get '/refrigerators', to: 'refrigerators#index'
  get '/refrigerators/:id', to: 'refrigerators#show'
  get '/refrigerators/:id/foods', to: 'refrigerators#children'

  get '/foods', to: 'foods#index'
  get '/foods/:id', to: 'foods#show'
end

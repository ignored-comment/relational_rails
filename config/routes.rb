Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  get '/', to: 'welcome#index'
  get '/garages', to: 'garages#index'
  get '/refrigerators', to: 'refrigerators#index'
  get '/refrigerators/:id', to: 'refrigerators#show', as: 'refrigerator'
  get '/garages/:id', to: 'garages#show', as: 'garage'
  get '/motorcycles', to: 'motorcycles#index'
  get '/motorcycles/:id', to: 'motorcycles#show', as: 'motorcycle'
  get '/garages/:id/motorcycles', to: 'garages#children'
end

Rails.application.routes.draw do
  resources :users, only: [:new, :create, :show]
  resource :session, only: [:new, :create, :destroy]
  resources :bands
  resources :albums, except: [:index, :new]
  resources :tracks, except: [:index, :new]

  get "/bands/:band_id/albums/new", to: 'albums#new', as: 'new_band_album'
  get "albums/:album_id/tracks/new", to: 'tracks#new', as: 'new_album_track'

  get 'login', to: 'sessions#new'
end

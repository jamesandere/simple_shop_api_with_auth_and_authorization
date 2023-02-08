Rails.application.routes.draw do
  resources :brands do
    resources :products
  end

  get '/users' => 'users#index'
  post '/signup' => 'users#create'

  post '/signin' => 'sessions#create'
  get '/signout' => 'sessions#destroy'
end

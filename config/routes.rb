Rails.application.routes.draw do
  resources :authors do
    resources :posts
  end

  resources :categories, only: [:index, :create]

  get '/users' => 'users#index'
  post '/signup' => 'users#create'
  post '/signin' => 'sessions#create'
  get'/signout' => 'sessions#destroy'

  get '/authors/:author_id/posts/:id/tags' => 'posts#post_tags'

end

Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  resources :users, only: [:new, :create]
  resources :admins, only: [:new, :create, :index, :destroy]
  resources :cloths do
    resources :comments, only: [:index, :create, :update, :destroy]
    resources :likes, only: [:index, :create, :destroy]
  end
  post '/login', to: 'sessions#create'
  delete '/logout', to: 'sessions#destroy'

  get '/csrfToken', to: 'application#get_csrf_token'

end

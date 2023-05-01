Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  devise_for :users, path: 'users', path_names: {
    sign_in: 'login',
    sign_out: 'logout',
    registration: 'signup'
  }

  # Define your application's other routes here, such as:
   resources :cloths do
    resources :comments, only: [:index, :create, :update, :destroy]
     resources :likes, only: [:index, :create, :destroy]
   end
   resources :admins, only: [:new, :create, :index, :destroy]
   get '/csrfToken', to: 'application#get_csrf_token'

end

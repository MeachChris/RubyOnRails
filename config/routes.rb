Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Defines the root path route ("/")
  # root "articles#index"

  # rails routes --expanded [[To check the routes in console]]
  root 'pages#home'
  get 'about', to: 'pages#about'
  #now that they are all exposed you can just do this....
  resources :articles
  # instead of 
   #  resources :articles, only: [:show, :index, :new, :create, :edit, :update, :destroy]
 

end

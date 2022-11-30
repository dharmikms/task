Rails.application.routes.draw do

  get '/users' , to:'users#index'

  get '/users/search' , to:'users#search'

  post '/users' , to:'users#create'

  put '/users/:id', to: 'users#update'

  get '/users/:id', to: 'users#show'

  delete '/users/:id', to: 'users#delete'




  # Defines the root path route ("/")
  # root "articles#index"
end

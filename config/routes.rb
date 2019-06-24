Rails.application.routes.draw do
  namespace :api do
    get '/drinks' => 'drinks#index'
    post '/drinks' => 'drinks#create'
    get 'drinks/:id' => 'dinks#show'
    patch '/drinks/:id' => 'drinks#update'
    delete '/drinks/:id' => 'drinks#destroy'

    get '/orders' => 'orders#index'
    post '/orders' => 'orders#create'
    get 'orders/:id' => 'orders#show'
    patch 'orders/:id' => 'orders#update'
    delete 'orders/:id' => 'orders#destroy'

    get '/recipes' => 'recipes#index'
    post '/recipes' => 'recipes#create'
    get '/recipes/:id' => 'recipes#show'
    patch '/recipes/:id' => 'recipes#update'
    delete '/recipes/:id' => 'recipes#destroy'

    post '/users' => 'users#create'
    post '/sessions' => 'sessions#create'
  end
end

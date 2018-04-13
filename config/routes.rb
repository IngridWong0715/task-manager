Rails.application.routes.draw do

  root 'welcome#welcome'
  resources :users, only: [:new, :create]
  get '/home', to: 'users#show' #show page? Or like a user home page?

  resources :lists do
    resources :items # nest under lists?!
  end

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

end

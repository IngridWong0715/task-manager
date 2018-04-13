Rails.application.routes.draw do

  root 'welcome#welcome'
  resources :users, only: [:new, :create, :show] do
    resources :lists
  end

  resources :items # nest under lists?!

  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

end

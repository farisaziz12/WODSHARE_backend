Rails.application.routes.draw do
  resources :health_data
  get '/movements', to: 'movements#index'
  get 'movements/:id', to: 'movements#show'
  get '/healthdata', to: 'health_data#index'
  post '/login', to: 'athletes#login'
  get '/validate', to: 'athletes#validate'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

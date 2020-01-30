Rails.application.routes.draw do
  resources :health_data
  get '/movements', to: 'movements#index'
  get 'movements/:id', to: 'movements#show'
  get '/healthdata', to: 'health_data#index'
  post '/athlete/login', to: 'athletes#login'
  post '/coach/login', to: 'coach#login'
  get '/athlete/validate', to: 'athletes#validate'
  get '/coach/validate', to: 'coaches#validate'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

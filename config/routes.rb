Rails.application.routes.draw do
  resources :health_data
  get '/movements', to: 'movements#index'
  get 'movements/:id', to: 'movements#show'
  get '/healthdata', to: 'health_data#index'
  post '/athlete/login', to: 'athletes#login'
  post '/coach/login', to: 'coaches#login'
  get '/athlete/validate', to: 'athletes#validate'
  get '/coach/validate', to: 'coaches#validate'
  post '/athletes', to: 'athletes#create'
  post '/coaches', to: 'coaches#create'
  get '/athlete/workouts', to: 'athletes#workouts'
  get '/coach/athlete/workouts/:id', to: 'coaches#athlete_workouts'
  get '/coach/athletes', to: 'coaches#athletes'
  post '/workouts', to: 'workouts#create'
  patch '/workouts/:id', to: 'workouts#update'
  patch '/athletes/:id', to: 'athletes#update'
  post '/athletes/findcoach/:id', to: 'athletes#find_coach'
  post '/coaches/findathlete/:id', to: 'coaches#find_athlete'
  delete '/athletes/delete/:id', to: 'athletes#destroy'
  delete '/workouts/delete/:id', to: 'workouts#destroy'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

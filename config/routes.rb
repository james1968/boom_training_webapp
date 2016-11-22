Rails.application.routes.draw do
  resources :training_sessions
  devise_for :users

  root "calendars#index"

  resources :calendars
  resources :groups

end

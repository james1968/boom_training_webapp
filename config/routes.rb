Rails.application.routes.draw do
  resources :training_sessions
  devise_for :users

  root "calendars#index"

    devise_for :users, controllers: {
      sessions: 'users/sessions'
    }


  resources :calendars

end

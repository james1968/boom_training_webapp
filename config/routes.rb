Rails.application.routes.draw do
  resources :training_sessions

  root "calendars#index"

    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }




  resources :calendars

end

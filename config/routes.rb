Rails.application.routes.draw do
  resources :training_sessions

  root "calendars#index"

    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

   resources :users do
  	resources :friends
  	resources :friend_requests
   end	


  resources :calendars
  resources :groups

end

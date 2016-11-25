Rails.application.routes.draw do
  resources :training_sessions

  root "calendars#index"

    devise_for :users, controllers: {
      sessions: 'users/sessions',
      registrations: 'users/registrations'
    }

  resources :users do
  	resources :friendships
  end

  resources :calendars
  resources :groups

  get '/groups/:id/join_group' => 'groups#join_group', as: 'join_group'
  get 'groups/add_member' => 'groups#add_member'
  post '/groups/:id/join_group' => 'groups/join_group#update', as: 'join_group_update'

end

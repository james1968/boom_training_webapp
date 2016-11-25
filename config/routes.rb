Rails.application.routes.draw do

  resources :training_sessions do
    resources :reviews
  end

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


  get 'groups/add_member' => 'groups#add_member'
  get 'users/:id' => 'users#show'
  get '/groups/:id/join_group' => 'groups#join_group', as: 'join_group'
  get 'groups/add_member' => 'groups#add_member'
  post '/groups/:id/join_group' => 'groups#join_group_update', as: 'join_update'


end

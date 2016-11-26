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
    resources :training_sessions
  end

  resources :calendars
  resources :groups


  get 'groups/add_member' => 'groups#add_member'
  get 'users/:id' => 'users#show'
  get '/groups/:id/join_group' => 'groups#join_group', as: 'join_group'
  get 'groups/add_member' => 'groups#add_member'
  post '/groups/:id/join_group' => 'groups#join_group_update', as: 'join_update'

  get '/training_sessions/:id/join_session' => 'training_sessions#join_session', as: 'join_session'
end

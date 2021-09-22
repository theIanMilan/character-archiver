Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
}

  root 'pages#welcome'
  # resources :profiles, only: %i[show edit update], param: :username
  get   '/profiles/:username',      to: 'profiles#show',    as: 'profile'
  get   '/profiles/:username/edit', to: 'profiles#edit',    as: 'edit_profile'
  put   '/profiles/:username',      to: 'profiles#update'
  patch '/profiles/:username',      to: 'profiles#update'
  get   '/profiles/:username/characters', to: 'profiles#user_characters', as: 'user_characters'

  resources :characters

  get   '/search_board',            to: 'searches#index',   as: 'search_board'
end

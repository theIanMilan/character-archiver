Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
}

  root 'pages#welcome'
  get   '/about_us',      to: 'pages#about',    as: 'about'
  # resources :profiles, only: %i[show edit update], param: :username
  get   '/profiles/:username',      to: 'profiles#show',    as: 'profile'
  get   '/profiles/:username/edit', to: 'profiles#edit',    as: 'edit_profile'
  put   '/profiles/:username',      to: 'profiles#update'
  patch '/profiles/:username',      to: 'profiles#update'
  get   '/profiles/:username/characters', to: 'profiles#user_characters', as: 'user_characters'

  resources :characters do
    resource :physical_attributes, only: %i[edit update destroy]
    resource :searches, only: %i[edit update destroy]
    resource :backstories, only: %i[edit update destroy]
  end
  resources :organizations

  get   '/search_board',            to: 'searches#search_board',     as: 'search_board'
  get   '/folklore',                to: 'backstories#folklore',      as: 'folklore'

  get   '/policies',                     to: 'policies#index',               as: 'policies'
  get   '/policies/open-gaming-license', to: 'policies#open_gaming_license', as: 'open_gaming_license'
end

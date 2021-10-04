Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations'
}

  root 'pages#welcome'
  get   '/home',          to: 'pages#welcome',  as: 'home'
  get   '/about_us',      to: 'pages#about',    as: 'about'
  resources :profiles, only: %i[show edit update], param: :username do
    resources :comments, only: %i[new create destroy]
  end
  
  get   '/profiles/:profile_username/characters', to: 'profiles#user_characters', as: 'user_characters'

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

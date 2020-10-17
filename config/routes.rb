# frozen_string_literal: true

Rails.application.routes.draw do
  resources :rooms
  devise_for :users,
             path: 'auth',
             defaults: { format: :json },
             path_names: {
               registration: 'sign_up',
               confirmation: 'confirmations'
             },
             controllers: {
               confirmations: 'confirmations',
               unlocks: 'unlocks',
               passwords: 'passwords',
               sessions: 'sessions',
               registrations: 'registrations'
             }

  namespace :api do
    resources :roles
    resources :movie_theaters
    resources :categories
  end
end

# frozen_string_literal: true

Rails.application.routes.draw do

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
    resources :categories
    resources :roles
    resources :movies
    resources :movie_theaters do
      scope :movie_theaters do
        resources :rooms
        resources :sections
      end
    end
  end
end

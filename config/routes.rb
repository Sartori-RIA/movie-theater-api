# frozen_string_literal: true

Rails.application.routes.draw do

  resources :movie_categories
  resources :movie_theater_movies
  devise_for :users,
             path: 'auth',
             defaults: {format: :json},
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
    resources :categories do
      scope :categories do
        resources :movies, only: %i[index]
      end
    end
    resources :movies do
      scope :movies do
        resources :categories, except: %i[index show]
      end
    end
    resources :movie_theaters do
      scope :movie_theaters do
        resources :rooms
        resources :sections
      end
    end
    resources :roles
  end
end

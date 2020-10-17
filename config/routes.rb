# frozen_string_literal: true

Rails.application.routes.draw do

  devise_for :users,
             path: 'api/auth',
             defaults: {format: :json},
             path_names: {
                 registration: 'sign_up',
                 confirmation: 'confirmations'
             },
             controllers: {
                 confirmations: 'api/auth/confirmations',
                 unlocks: 'api/auth/unlocks',
                 passwords: 'api/auth/passwords',
                 sessions: 'sessions',
                 registrations: 'api/auth/registrations'
             }

  namespace :api do

    resources :categories do
      scope module: :categories do
        resources :movies, only: %i[index]
      end
    end

    resources :movies do
      scope module: :movies do
        resources :categories, except: %i[index show]
      end
    end

    resources :movie_theaters do
      scope module: :movie_theaters do
        resources :rooms
        resources :sections
      end
    end

    resources :roles
  end
end

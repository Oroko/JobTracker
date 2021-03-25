# frozen_string_literal: true

Rails.application.routes.draw do
  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'jobs#index'
  resources :jobs
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

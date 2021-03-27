# frozen_string_literal: true

Rails.application.routes.draw do
  resources :applications
  resources :companies
   devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'jobs#index'
  resources :jobs
  #get '/jobs', to: 'jobs#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# , as: "unique_prefix", controllers: { registrations: 'registrations' }
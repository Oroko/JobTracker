# frozen_string_literal: true

Rails.application.routes.draw do


  get 'jobs/my_jobs_applications', to: 'jobs#my_jobs_applications'
  post 'jobs/my_jobs_applications', to: 'jobs#my_jobs_applications'
  get '/jobs/filter', to: 'jobs#filter'
  post '/jobs/filter', to: 'jobs#filter'
  resources :applications
  resources :companies

  devise_for :users, controllers: { registrations: 'registrations', omniauth_callbacks: 'users/omniauth_callbacks' }
  root 'jobs#index'
  resources :jobs do
    resources :applications, only: %i[new index]
  end
  # get '/jobs', to: 'jobs#index'

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end

# , as: "unique_prefix", controllers: { registrations: 'registrations' }

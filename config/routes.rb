# frozen_string_literal: true

# rubocop:disable

Rails.application.routes.draw do
  get 'sign_up', to: 'users#new'
  get 'log_in', to: 'sessions#new', as: 'log_in'
  get 'log_out', to: 'sessions#destroy'
  resources :users
  resources :sessions
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'application#index'
end

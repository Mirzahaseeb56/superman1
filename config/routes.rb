Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
    registrations: 'admins/registrations'
  }
  get 'customers/edit_customer', to: 'customers#edit_customer', as: 'edit_customer'
  post 'customers/manage_customer', to: 'customers#manage_customer', as: 'manage_customer'
  resources :admins
  resources :roles
  resources :staff_users
  resources :customers, only: [:edit, :update, :index]
  resources :dashboard, only: [:index]
  root "dashboard#index"
end

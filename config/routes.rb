Ablass::Application.routes.draw do
  get "flames/index"

  get 'home' => 'home#index'

  get 'start' => 'start#index'

  # Our resources
  resources :sins, only: %i[index] do
    resources :projects, only: %i[index show], controller: :sin_projects do
      member do
        get 'temperature'
      end
    end
  end
  resources :flames, only: %i[index]

  # Admin backend
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  root 'start#index'
end

Ablass::Application.routes.draw do

  get 'home'    => 'home#index'

  get 'start' => 'start#index'
  get 'contact' => 'contact#index'
  root 'start#index'

  # Our resources
  resources :sins, only: %i[index] do
    resources :projects, only: %i[index show], controller: :sin_projects do
      member do
        get 'temperature'
      end
      resources :donations, only: :create
    end
    get 'detail', on: :member
  end
  resources :flames, only: %i[index]
  resource :donation, only: :show

  # Admin backend
  devise_for :users
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'
end

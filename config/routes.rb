Rails.application.routes.draw do
  get 'artists/index'
  get 'artists/show'
  get 'artists/new'
  get 'artists/edit'
  root to: 'artists#index'
 
  resources :artists, only: [:index, :show, :new, :create, :edit, :update]
  resources :sessions, only: [:new, :create, :destroy]
  resources :users, only: [:new, :create, :edit, :update] do
      member do
        get :pass, to: 'users#pass'
      end
  end
end

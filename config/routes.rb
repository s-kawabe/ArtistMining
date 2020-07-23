Rails.application.routes.draw do
  root to: 'artists#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
 
  resources :artists, only: [:index, :show, :new, :create, :edit, :update]
  resources :users, only: [:new, :create, :edit, :update] do
      member do
        get :pass, to: 'users#pass'
      end
  end
end

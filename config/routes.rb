Rails.application.routes.draw do
  get 'comments/new'
  get 'comments/create'
  get 'new/create'
  get 'favorites/create'
  get 'favorites/destroy'
  root to: 'artists#index'
  
  get 'login', to: 'sessions#new'
  post 'login', to: 'sessions#create'
  delete 'logout', to: 'sessions#destroy'
 
  resources :artists, only: [:index, :show, :new, :create, :edit, :update] do
    collection do
      get :search, to: 'artists#search'
    end

    resources :favorites, only: [:create, :destroy]
  end

  resources :comments, only: [:index, :create, :destroy]
    
  resources :users, only: [:new, :create, :show, :edit, :update] do
    member do
      get :pass, to: 'users#pass'
    end
  end

end

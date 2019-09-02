Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resource :session, only: %i[new create destroy]
  
  resources :users, only: %i[new create show] do
    get :activate, on: :collection
  end

  resources :bands do
    resources :albums, only: [:new]
  end

  resources :albums, only: %i[show create edit update destroy] do
      resources :tracks, only: %i[new]
  end

  resources :tracks, only: %i[show create edit update destroy]
  resources :notes, only: %i[create destroy]
end

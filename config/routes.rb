Rails.application.routes.draw do
  root to: "static_pages#home"
  resource :session, only: [:new, :create, :destroy]
  resources :comments, only: [:create]
  resources :goals, except: :show

  resources :users, only: [:new, :create, :show] do
    resources :goals, only: :show
  end
end

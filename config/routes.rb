Rails.application.routes.draw do
  get 'relationships/create'
  get 'relationships/destroy'
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users
  resources :facilities do
    collection do
      post:confirm
      get:search
    end
    resources :comments
  end
  resources :relationships, only: [:create, :destroy]
  resources :favorites, only: [:create, :destroy,:index]
  get 'top/index'
  root 'top#index'

  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  devise_scope :user do
    post 'users/admin_guest_sign_in', to: 'users/sessions#adomin_guest_sign_in'
  end

  resources :users, only: [:show] do
   member do
      get :following, :followers
    end
 end
  resources :conversations do
    resources :messages
  end
end

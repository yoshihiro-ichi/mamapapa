Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :users
  resources :facilities do
    collection do
      post:confirm
      get:search
    end
  end
  resources :favorites, only: [:create, :destroy,:index]
  root 'top#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?
  devise_scope :user do
    post 'users/guest_sign_in', to: 'users/sessions#guest_sign_in'
  end

  devise_scope :user do
    post 'users/admin_guest_sign_in', to: 'users/sessions#adomin_guest_sign_in'
  end
end

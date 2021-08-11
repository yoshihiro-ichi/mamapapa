Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  resources :facilities do
    collection do
      post:confirm
    end
  end
  root 'facilities#index'
  mount LetterOpenerWeb::Engine, at: "/letter_opener" if Rails.env.development?

  # resources :facilities do
  #   member do
  #     patch:confirm
  #   end
  # end
end

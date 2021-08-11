Rails.application.routes.draw do
  devise_for :users
  resources :facilities do
    collection do
      post:confirm
    end
  end
  root 'faciliies#index'
  # resources :facilities do
  #   member do
  #     patch:confirm
  #   end
  # end
end

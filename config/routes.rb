Rails.application.routes.draw do
  resources :facilities do
    collection do
      post:confirm
    end
  end

  # resources :facilities do
  #   member do
  #     patch:confirm
  #   end
  # end
end

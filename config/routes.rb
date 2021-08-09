Rails.application.routes.draw do
  resources :facilities do
    collection do
      post :confirm
    end
  end
end

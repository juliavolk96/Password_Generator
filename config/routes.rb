Rails.application.routes.draw do
  resources :passwords do
    collection do
      post 'clear_all'
    end
  end
  root 'passwords#index'
end
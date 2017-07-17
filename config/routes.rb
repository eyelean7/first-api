Rails.application.routes.draw do
  resources :messages
  resources :groups do
    resources :messages
  end
end

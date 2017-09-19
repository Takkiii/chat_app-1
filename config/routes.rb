Rails.application.routes.draw do
  namespace :api, { format: 'json' } do
    resources :messages 
    resources :contents
  end
  root 'messages#index'

  devise_for :users

end

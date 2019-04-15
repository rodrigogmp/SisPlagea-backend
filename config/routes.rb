Rails.application.routes.draw do
  # namespace :api, defaults: {format: 'json'} do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :studants
      resources :users, only: [:create,:show]
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

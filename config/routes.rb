Rails.application.routes.draw do
  # namespace :api, defaults: {format: 'json'} do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :studants
      resources :subjects do
        member do
          post :upload
        end
      end
      resources :projects do
        member do
          post :link_participant
          put 'update_participant/:participant_id' => 'projects#update_participant'
        end
      end
      resources :users, only: [:create,:show]
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

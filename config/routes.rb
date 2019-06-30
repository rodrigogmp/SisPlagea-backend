Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      mount_devise_token_auth_for 'User', at: 'auth'
      resources :contacts, except: [:update]
      resources :students
      resources :attachments
      resources :publications do
        collection do
          post :create_from_bibtex
        end
      end
      resources :study_groups do
        member do
          get :participants
          post 'link_participant' => 'study_groups#link_participant'
          delete 'unlink_participant/:participant_id' => 'study_groups#unlink_participant'
        end
      end

      resources :subjects do
        member do
          post :upload
          get :materials
        end
      end
      resources :projects do
        member do
          get :participants
          post 'link_participant' => 'projects#link_participant'
          delete 'unlink_participant/:participant_id' => 'projects#unlink_participant'
          put 'update_participant/:participant_id' => 'projects#update_participant'
        end
      end
      resources :users ,only: [:create,:show] do
        collection do
          put :update
          post :recover_password
          patch :change_password
        end
      end
    end
  end
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

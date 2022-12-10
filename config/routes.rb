Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :users do
        get 'search_user'
      end
      resources :groups do
        get 'get_group_users'
        delete 'delete_user'
      end
      resources :users_groups
      resources :photos
      resources :tags
      resources :categories do
        get 'get_category'
      end
      resources :shops do
        get 'get_shop'
        get 'get_all_shops'
      end
      resources :reviews do
        get 'get_review'
      end

      mount_devise_token_auth_for 'User', at: 'auth', controllers: {
        registrations: 'api/v1/auth/registrations'
      }

      namespace :auth do
        resources :sessions, only: %i[index]
      end
    end
  end
end

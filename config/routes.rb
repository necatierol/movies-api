Rails.application.routes.draw do
  mount_devise_token_auth_for 'User', at: 'auth'
  namespace :api do
    namespace :v1 do
      resources :contents do
        resources :seasons do
        end
      end
    end
  end
end

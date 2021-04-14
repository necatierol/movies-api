Rails.application.routes.draw do
  resources :contents do
    resources :seasons do
    end
  end  
end

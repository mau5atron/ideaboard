Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :ideas  
      root to: 'ideas#index'
    end
  end

end

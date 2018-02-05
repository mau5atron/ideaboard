Rails.application.routes.draw do
  namespace :api do
    namespace :v1 do
      resources :ideas
      get 'api/v1/ideas'
      root 'api/v1/ideas#index'
    end
  end

end

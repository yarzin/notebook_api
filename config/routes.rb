Rails.application.routes.draw do
  apipie
  namespace :api do
    namespace :v1 do
      resources :readmes
    end
  end
end

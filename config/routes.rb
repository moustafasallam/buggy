Rails.application.routes.draw do

  namespace :api, defaults: {format: :json} do
    namespace :v1 do
      resources :bugs, only: [:show, :create]
    end
  end

  namespace :admin do
    resources :bugs, only: [:index]
  end

  root :to => "admin/bugs#index"
end

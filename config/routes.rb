Rails.application.routes.draw do

  namespace :admin do
    resources :bugs, only: [:index]
  end

  root :to => "admin/bugs#index"
end

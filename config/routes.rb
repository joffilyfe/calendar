Rails.application.routes.draw do

  devise_for :users
  namespace :core do
    resources :tasks
  end

end

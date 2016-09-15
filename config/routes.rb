Rails.application.routes.draw do

  root 'core/tasks#index'

  devise_for :users
  namespace :core do
    resources :tasks
  end

end

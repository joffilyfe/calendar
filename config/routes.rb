Rails.application.routes.draw do
  mount API => '/'
  root 'core/tasks#index'

  devise_for :users
  namespace :core do
    resources :tasks
  end

end

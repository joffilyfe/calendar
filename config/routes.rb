Rails.application.routes.draw do
  mount API => '/'
  root 'core/site#index'

  devise_for :users
  namespace :core do
    resources :tasks
  end

end

Rails.application.routes.draw do

  namespace :core do
    resources :tasks
  end

end

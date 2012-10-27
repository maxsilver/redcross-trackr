RedcrossTrackr::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users

  resources :locations

  root :to => 'locations#index'
end

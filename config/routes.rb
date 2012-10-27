RedcrossTrackr::Application.routes.draw do
  devise_for :users

  resources :locations

  root :to => 'locations#index'
end

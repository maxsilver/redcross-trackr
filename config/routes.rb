RedcrossTrackr::Application.routes.draw do
  mount RailsAdmin::Engine => '/admin', :as => 'rails_admin'

  devise_for :users, :skip => [:registrations]
  as :user do
    get 'users/edit' => 'devise/registrations#edit', :as => 'edit_user_registration'
    put 'users' => 'devise/registrations#update', :as => 'user_registration'
  end

  resources :chapters
  resources :locations do
    resources :items do
      get "give/" => "items#give", :as => :give
      get "lend/" => "items#lend", :as => :lend
    end
  end

  root :to => 'locations#index'
end

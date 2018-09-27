Rails.application.routes.draw do
  devise_for :users, :path_prefix => 'u', :controllers => { :registrations => "user/registrations" }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  resources :users, only: [:show]

  resources :posts
  # get 'tags/:tag', to: 'post#index', as: :tag

  root 'posts#index'
end

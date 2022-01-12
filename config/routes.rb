Rails.application.routes.draw do
  get 'tags/show'
  root "homes#top"
  get "about" => "homes#about"
  get 'search' => 'searchs#search'
  devise_for :users
  resources :users, only: [:show, :edit, :update]
  resources :logs, only: [:index, :show, :create, :edit, :update, :destroy]
  resources :recipes do
    resources :reviews, only: [:create, :destroy]
    resources :favorites, only: [:index, :create]
  end

  resources :tags, only: [:show]
  delete "recipe/:recipe_id/favorite", to: "favorites#destroy", as: "recipe_favorite"
end

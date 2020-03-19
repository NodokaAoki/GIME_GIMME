Rails.application.routes.draw do

  get 'search/search'
  get 'search/search_page'
  namespace :admin do
    resources :members, only: [:index,:show, :edit, :update]
    resources :genres, only: [:index,:create, :update]
    resources :games, only: [:index,:show, :edit, :update,:destroy]
    resources :models, only: [:index,:create, :update]
    resources :game_reports, only: [:index,:show, :update]
    resources :comment_reports, only: [:index,:show, :update]
  end
  get 'admin/top' => 'admin#top', as: 'admin_top'
  devise_for :admins, controllers: {
      sessions:      'admins/sessions',
  }
  devise_for :members, controllers: {
  		sessions:      'members/sessions',
      passwords:     'members/passwords',
      registrations: 'members/registrations'
  }
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html

  root to: 'home#top'
  get 'home/about' => 'home#about'

  resources :members, only: [:show, :edit, :update]
  get 'members/:id/delete_me' => 'members#delete_me', as: 'delete_me'
  put 'members/:id/delete_me' =>'members#withdraw', as: 'withdraw'
  resources :game_reports, only: [:new, :create,:show]
  resources :comment_reports, only: [:new, :create,:show]

  resources :games, only: [:index, :show, :edit, :update, :create,:new] do
    resource :comments, only: [:create,:destroy]
    resource :favorites, only: [:create,:destroy]
  end
  put 'games/:id/hidden'      => 'games#hidden'     , as: 'hidden'
  post 'games/:id/playtime_create'      => 'games#playtime_create'


end

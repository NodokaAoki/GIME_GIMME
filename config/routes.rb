Rails.application.routes.draw do

  namespace :admin do
    resources :members, only: [:index,:show, :edit, :update]
    resources :genres, only: [:index,:show,:create, :update,:destroy]
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

  resources :games, only: [:show, :edit, :update, :create,:new]
  get 'games/:id/delete_game' => 'games#delete_game', as: 'delete_game'
  get 'games/:id/hidden'      => 'games#hidden'     , as: 'hidden'


end

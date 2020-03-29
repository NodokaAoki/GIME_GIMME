Rails.application.routes.draw do

  get 'search/search'
  get 'search/search_page'
  namespace :admin do
    resources :members, only: [:index,:show, :edit, :update]
    get 'members/:id/comments' =>'members#comments', as: 'member_comments'
    get 'members/:id/games' =>'members#games', as: 'member_games'
    get 'members/:id/game_reports' =>'members#game_reports', as: 'member_game_reports'
    get 'members/:id/comment_reports' =>'members#comment_reports', as: 'member_comment_reports'
    resources :genres, only: [:index,:create, :update]
    resources :games, only: [:index,:show, :edit, :update,:destroy]
    resources :comments, only: [:destroy]
    resources :models, only: [:index,:create, :update]
    resources :game_reports, only: [:index,:show, :update]
    resources :comment_reports, only: [:index,:show, :update]
    resources :contacts, only: [:edit, :update, :index]
    post 'contacts/status_update' =>'contacts#status_update', as: 'contact_status_update'
    resources :warning_mails, only: [:new, :create, :show,:index]
    get 'search/search'
    get 'search/search_page'
  end
  get 'admin/top' => 'admin#top', as: 'admin_top'
  devise_for :admins, controllers: {
      sessions:      'admins/sessions',
      passwords:     'admins/passwords',
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
  get 'members/:id/comments' =>'members#comments', as: 'my_comments'
  get 'members/:id/games' =>'members#games', as: 'my_games'
  get 'members/:id/favorites' =>'members#favorites', as: 'my_favorites'
  resources :game_reports, only: [:new, :create,:show]
  resources :comment_reports, only: [:new, :create,:show]
  resources :contacts, only: [:new, :create]

  resources :games, only: [:index, :show, :edit, :update, :create,:new] do
    resource :comments, only: [:create,:destroy]
    resource :favorites, only: [:create,:destroy]
  end
  put 'games/:id/hidden'      => 'games#hidden'     , as: 'hidden'
  post 'games/:id/playtime_create'      => 'games#playtime_create'
  get 'home/ranking' =>'home#ranking', as: 'ranking'


end

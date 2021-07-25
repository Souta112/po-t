Rails.application.routes.draw do
  devise_for :user_groups, controllers: {
    registrations: 'user_groups/registrations'
  }

  root to: 'homes#top'

 devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  passwords: 'admins/passwords',
  registrations: 'admins/registrations'
}

 namespace :admin do
   resources :users
  get "search" => "search#search"
  end

devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
  }

scope module: :public do
  resources :memos
  resources :users
  resources :search , :only => [:index, :search]
  resources :tags
  resources :user_groups
  #devise_for :user_groups, controllers: {
   # sessions: 'user_groups/sessions',
    #passwords: 'user_groups/passwords',
    #registrations: 'user_groups/registrations'
  #}
  #post "memos" => "memos#index"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
end
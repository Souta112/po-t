Rails.application.routes.draw do
  root to: 'homes#top'

 devise_for :admins, controllers: {
  sessions: 'admins/sessions',
  passwords: 'admins/passwords',
  registrations: 'admins/registrations'
}

 namespace :admin do
   resources :users
  end

devise_for :users, controllers: {
    sessions: 'users/sessions',
    passwords: 'users/passwords',
    registrations: 'users/registrations',
  }

scope module: :public do
  resources :memos
  resources :users
  get "search" => "search#search"
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end
end
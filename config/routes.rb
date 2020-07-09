Rails.application.routes.draw do
  get 'sessions/new'

  root 'staticpages#home' 
  
  get 'staticpages/home' 
  get 'staticpages/link' => 'https://www.instagram.com/?hl=ja'
  
  get 'users/show' => 'users#show'
  get 'users/new'  => 'users#new'
  post 'users/new'  => 'users#create'
  
  get 'sessions/new' => 'sessions#new'
  post 'sessions/new' => 'sessions#create'
  get 'sessions/edit' => 'sessions#edit'
  
  
  get 'microposts/newpost' => 'microposts#new'
  post 'microposts/newpost' => 'microposts#create'
  
  get 'users/following_user' => 'users#following'
  
  resources :users do
    member do
      get :following, :followers
    end
  end
  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

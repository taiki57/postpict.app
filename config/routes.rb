Rails.application.routes.draw do
 

  root 'staticpages#home' 
  
  get 'staticpages/home' => 'staticpages#home' 
  get 'staticpages/link' => 'https://www.instagram.com/?hl=ja'
  
  
  resources 'users'
  post 'users/:id' => 'users#show'
  
  post 'users/new' => 'users#create'
  
 
  get 'sessions/new' => 'sessions#new'
  post 'sessions/new' => 'sessions#create'
  get 'sessions/destroy' => 'sessions#destroy'
  
  
  
  get 'microposts/newpost' => 'microposts#new'
  post 'microposts/newpost' => 'microposts#create'
 
  delete 'microposts/:id/destroy' => 'microposts#destroy'
  
  get 'memo/memo' => 'memo#new'
  post 'memo/memo' => 'memo#create'
  get 'memo/show' => 'memo#show'
  
  
  get 'users/follow' => 'users#follow'
  

  
  post 'users/:id/following' => 'users#following'
  
  resources :users do
    member do
      get :following, :followers
    end
  end


  
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

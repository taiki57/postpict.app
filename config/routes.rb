Rails.application.routes.draw do
  get 'sessions/new'

  root 'staticpages#home' 
  
  get 'staticpages/home' 
  get 'staticpages/link' => 'https://www.instagram.com/?hl=ja'
  get 'staticpages/show' => 'users#show'
  
  get 'staticpages/new'  => 'users#new'
  post 'staticpages/new'=> 'users#create'
  
  get '/login' => 'sessions#new'
  post 'sessions/new' => 'sessions#create'
  get '/edit' => 'sessions#edit'
  
  
  get 'staticpages/newpost' => 'microposts#new'
  post 'staticpages/newpost' => 'microposts#create'
  
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

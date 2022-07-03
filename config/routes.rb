Rails.application.routes.draw do

  get 'youtube/main'=>'youtube#main'
  root 'youtube#main'
  
  get 'aboutthispage/index' => 'aboutthispage#index'
  
  get 'youtube/index' => 'youtube#index'
  
  get 'youtube/new'  => 'youtube#new'
  
  post 'youtube/:id' => 'youtube#create'
  
  end
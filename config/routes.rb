Rails.application.routes.draw do
  
  get 'youtube/main'=>'youtube#main'
  root 'youtube#main'
  
  get 'aboutthispage/index' => 'aboutthispage#index'
  
  end
Rails.application.routes.draw do
  devise_for :users
  root 'games#index'
  get 'games' => 'games#index'
  get 'games/:id' => 'games#show', as: 'game'
  get 'listings/new' => 'listings#new'
  post 'listings' => 'listings#create'
  get 'listings/:id' => 'listings#show', as: 'listing'
  get 'charges/new' => 'charges#new'
  post 'charges' => 'charges#create'
  get 'conversations' => 'conversations#index'
  post 'conversations' => 'conversations#create'
  get 'conversations/:conversation_id/messages' => 'messages#index', as: 'conversation_messages'
  post 'conversations/:conversation_id/messages' => 'messages#create'
end

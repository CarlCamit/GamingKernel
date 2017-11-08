Rails.application.routes.draw do
  devise_for :users
  root 'games#index'
  get 'games/:id' => 'games#show', as: 'game'
end

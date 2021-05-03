Rails.application.routes.draw do
  root to: 'memos#index'
  # get 'memos', to: 'memos#index'
  # get 'memos/new', to: 'memos#new'
  # post 'posts', to: 'memos#create'
  resources :memos, only: [:index, :new, :create, :destroy]
end

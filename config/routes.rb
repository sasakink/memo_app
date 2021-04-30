Rails.application.routes.draw do
  get 'memos', to: 'memos#index'
  get 'memos/new', to: 'memos#new'
  post 'posts', to: 'memos#create'
end

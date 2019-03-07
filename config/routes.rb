Rails.application.routes.draw do
  get 'gym/name:string'
  get 'gym/user:references'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
end

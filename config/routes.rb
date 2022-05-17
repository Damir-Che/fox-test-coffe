Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  post 'post/massages_telegram', to: 'posts#massages_telegram'
end

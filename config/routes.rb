Rails.application.routes.draw do
  resources :posts
  post 'post/massages_telegram', to: 'posts#massages_telegram'
end

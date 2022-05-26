Rails.application.routes.draw do
  root 'posts#index'
  resources :posts
  post 'post/enter_message', to: 'posts#enter_message', as: 'enter_message'

  telegram_webhook TelegramWebhookController
end

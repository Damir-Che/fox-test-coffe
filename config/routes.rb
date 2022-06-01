Rails.application.routes.draw do
  root 'posts#index'
  resources :posts do
    get 'coffee_store', :on => :collection
    get 'chat_messages', :on => :collection
  end
  post 'post/enter_message', to: 'posts#enter_message', as: 'enter_message'

  telegram_webhook TelegramWebhookController
end

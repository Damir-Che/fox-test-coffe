class OrdersController < ApplicationController
  def orders_create
    p '-------'
    p params
    # Orders::CreateService.call(tg_user_id: chat['id'], product_id: params[:id])
    redirect_to coffee_store_posts_path
  end
end

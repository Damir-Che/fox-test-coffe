# frozen_string_literal: true

module Orders
  class CreateService < ::ApplicationService
    attr_accessor :tg_user_id, :product_id

    def process
      p '------'
      @result = create_order
    end

    private

    def create_order
      ::Order.create(telegram_user_id: tg_user_id, product_id: product_id)
    end
  end
end

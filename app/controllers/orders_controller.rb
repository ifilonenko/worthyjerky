class OrdersController < ApplicationController
  # before_action :authorize, only: [:index]
  def index
    render json: { orders: Order.where(completed: false) }
  end
end

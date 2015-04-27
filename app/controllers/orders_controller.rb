class OrdersController < ApplicationController
  # before_action :authorize
  def index
    render json: { orders: Orders.all }
  end
end

class OrdersController < ApplicationController
  before_action :authorize
  def index
    render json: { orders: Order.all }
  end
end

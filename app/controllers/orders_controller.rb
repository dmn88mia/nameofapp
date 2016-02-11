class OrdersController < ApplicationController
  before_filter :authenticate_user!


   def index
  end

  def show
  end

  def new
    @order = Order.new
  end

  def create
  end

  def destroy
  end
end
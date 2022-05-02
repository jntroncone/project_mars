class OrdersController < ApplicationController

    devise_group :order_checker, contains: [:user, :admin]
    before_action :authenticate_order_checker!

    def index
        @orders = Order.all
      end
    
      def show
        @order = Order.find(params[:id])
      end
    
      def new
        @order = Order.new
      end

      def create
        @order = Order.new(order_params)
        @current_cart.line_items.each do |item|
          @order.line_items << item
          item.cart_id = nil
        end
        @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        redirect_to orders_path
      end

      def update
        @order = Order.find(params[:id])
        if @order.update(params.require(:order).permit(:status))
          flash[:success] = "Order successfully updated!"
          redirect_to order_url(@order)
        else
          flash.now[:error] = "Order update failed"
          render :back
        end
      end
    
      
      private
        def order_params
          params.require(:order).permit(:name, :email)
        end
end

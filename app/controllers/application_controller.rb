class ApplicationController < ActionController::Base
    before_action :current_cart

  private
    def current_cart
      if session[:cart_id]
        cart = Cart.find_by(:id => session[:cart_id])
        if cart.present?
          @current_cart = cart
          cookies[:cart_id] = @current_cart.id
        else
          session[:cart_id] = nil
        end
      end

      if session[:cart_id] == nil
        cart = Cart.find_by(:id => cookies[:cart_id])
        if cart.present?
          @current_cart = cart
        else
          @current_cart = Cart.create
          session[:cart_id] = @current_cart.id
        end
      end
    end

end

class CartsController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, with: :invalid_cart
    before_action :set_cart, only: [:show, :edit, :update, :destroy]

    def index
        cart = @current_cart
        redirect_to cart_path(cart)
    end

    def show
        cart = @current_cart
        render :show
    end

    def new
        @cart = Cart.new
    end

    def edit
    end

    def create
        @cart = Cart.new(cart_params)

        respond_to do |format|
            if @cart.save
                format.html { redirect_to @cart, notice: 'Cart was successfully created.' }
                format.json { render :show, status: :created, location: @cart }
            else
                format.html { render :new }
                format.json { render json: @cart.errors, status: :unprocessable_entity }
            end
        end
    end

    def update
        respond_to do |format|
            if @cart.update(cart_params)
                format.html { redirect_to @cart, notice: 'Cart was successfully updated.' }
                format.json { render :show, status: :ok, location: @cart }
            else
                format.html { render :edit }
                format.json { render json: @cart.errors, status: :unprocessable_entity }
            end
        end
    end

    def destroy
        @cart.destroy if @cart.id == session[:cart_id]
        session[:cart_id] = nil
        respond_to do |format|
            format.html { redirect_to root_path, notice: 'Cart was successfully destroyed.' }
            format.json { head :no_content }
        end
    end

    private
    def set_cart
        @cart = Cart.find(params[:id])
    end

    def cart_params
      params.fetch(:cart, {})
    end

    def invalid_cart
      logger.error "Attempt to access invalid cart #{params[:id]}"
      redirect_to root_path, notice: "That cart doesn't exist"
    end
end

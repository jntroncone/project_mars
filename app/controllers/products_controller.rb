class ProductsController < ApplicationController

    before_action :authenticate_admin!, except: [show, index]

    def show
        @product = Product.find(params[:id])
    end

    def index
        @products = Product.all
        render :index
    end

    def new
        @product = Product.new
        render :new
    end

    def create
        @product = Product.new(params.require(:product).permit(:name, :description))
        if @product.save
          flash[:success] = "New product successfully added!"
          redirect_to products_url
        else
          flash.now[:error] = "Product creation failed"
          render :new
        end
    end

    def edit
        @product = Product.find(params[:id])
        render :edit
    end

    def update
        @product = Product.find(params[:id])
        if @product.update(params.require(:product).permit(:name, :description))
          flash[:success] = "Product successfully updated."
          redirect_to product_url(@product)
        else
          flash.now[:error] = "Product update failed."
          render :edit
        end
    end

    def destroy
        @product = Product.find(params[:id])
        @product.destroy
        flash[:success] = "The product was successfully destroyed."
        redirect_to products_url
    end
end

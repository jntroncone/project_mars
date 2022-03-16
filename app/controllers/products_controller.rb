class ProductsController < ApplicationController
    def show
        @product = Product.find(params[:id])
    end

    def index
        @products = Product.all
        render :index
    end
end

class ProductsController < ApplicationController
   before_action :initialize_session
   before_action :increment_visit_count, only: %i[index product]
   before_action :load_cart
    def show
        @product = Product.find(params[:id])
    end

    def index
        @products = Product.all
        render :index
    end
    def add_to_cart
        id= params[:id].to_i
        session[:cart] << id unless session[:cart].include?(id)
        redirect_to root_path
    end
    private
    def initialize_session
        session[:visit_count] ||=0
        session[:cart]||=[]
    end

    def increment_visit_count
        session[:visit_count] +=1
        @visit_count = session[:visit_count]
    end

    def load_cart
        @cart=Product.find(session[:cart])
    end
end

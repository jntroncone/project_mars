class LineItemsController < ApplicationController
    def index
      @line_items = LineItem.all
    end
  
    def show
    end

    def new
      @line_item = LineItem.new
    end
  
    def edit
    end
  
    def create
      @product = Product.find(params[:product_id])
      @line_item = @current_cart.add_product(@product)
  
      respond_to do |format|
        if @line_item.save
          format.html { redirect_to @line_item.cart}
          format.json { render :show, status: :created, location: @line_item }
        else
          format.html { render :new }
          format.json { render json: @line_item.errors, status: :unprocessable_entity }
        end
      end
    end

    def update
      respond_to do |format|
        if @line_item.update(line_item_params)
          format.html { redirect_to @line_item}
          format.json { render :show, status: :ok, location: @line_item }
        else
          format.html { render :edit }
          format.json { render json: @line_item.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def destroy
      @line_item = LineItem.find(params[:id])
      @line_item.destroy
      redirect_to carts_url
    end
    def add_quantity
      @line_item = LineItem.find(params[:id])
      @line_item.quantity += 1
      @line_item.save
      redirect_to cart_path(@current_cart)
    end
    
    def reduce_quantity
      @line_item = LineItem.find(params[:id])
      if @line_item.quantity > 1
        @line_item.quantity -= 1
      else
        @line_item.destroy 
      end
      @line_item.save
      redirect_to cart_path(@current_cart)
    end
  
    private
      def set_line_item
        @line_item = LineItem.find(params[:id])
      end
  
      def line_item_params
        params.require(:line_item).permit(:product_id)
      end
end

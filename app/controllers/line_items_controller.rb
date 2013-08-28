class LineItemsController < InheritedResources::Base
  before_action :set_line_item, only: [:show, :edit, :update,  :destroy,  :decrement]
  before_action :currcart , only: [:show, :edit, :update, :create, :destroy]
  
  

  def create
    @cart = current_cart
    product = Product.find(params[:product_id])
    @line_item = @cart.add_product(product.id)
    
    create! do |format|
   	  if @line_item.save
        session[:counter] = nil

   	    format.html {redirect_to store_url}

        format.js  { @current_item = @line_item }

   	    format.json {render json: @line_item,
   	      status: :created, location: @line_item }
   	   else
   	  	 format.html { render action: "new" }
   	  	 format.json { render json: @line_item.errors,
   	  	   status: unprocessable_entity }
      end
    end

  end

  def destroy
   if @line_item.quantity > 1
     @line_item.update_attributes(quantity: @line_item.quantity - 1 )
     
   else
    @line_item.destroy
   end
  
    destroy! do |format|
      format.html { redirect_to store_url }
      format.json { head :ok }
    end

  end

  def decrement
    @cart = current_cart

    @line_item = @cart.decrease(set_line_item)


    respond_to do |format|
      if @line_item.save
        format.html { redirect_to store_path, notice: 'Line item was successfully updated.' }
        format.js {@current_item = @line_item}
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.js {@current_item = @line_item}
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
       end
    end
  end
  protected
  def currcart
  	@cart = current_cart
  end
   def set_line_item
      @line_item = LineItem.find(params[:id])
   end  
  # def permitted_params
  #   params.permit(:line_item =>[:product_id, :cart_id])
  # end
end

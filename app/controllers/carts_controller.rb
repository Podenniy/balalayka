class CartsController < InheritedResources::Base
 #before_action :set_cart , only: [:edit, :update, :destroy]

  def show
  	begin
      @cart = current_cart
  	  set_cart
      set_cart = @cart
  	rescue ActiveRecord::RecordNotFound
  		logger.error"Попытка доступа к несуществующей корзине #{params[:id]}"
  		redirect_to store_url, notice: 'Несуществующая корзина'
  	else
      respond_to do |format|
        format.html #show.html.erb
        format.json { render  json:set_cart }
      end
  	end
  end

  def destroy
    @cart = current_cart
    @cart.destroy
    session[:cart_id] = nil
    destroy! do | format |
      if @cart.line_items.empty?
        format.html { redirect_to store_url }
        format.js
        format.json { head :ok }
      end
    end
  end
private

  def set_cart
    @cart = Cart.find(params[:id])
  end

  def currcart
    @cart = current_cart
  end
end

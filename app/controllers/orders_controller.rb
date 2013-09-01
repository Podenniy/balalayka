class OrdersController < InheritedResources::Base
  before_action :currcart 
  before_action :set_order, only: [ :show, :edit, :update, :destroy]

  def index
    @orders = Order.paginate page: params[:page], order: 'created_at desc',
       per_page: 10

    index! do | format |
      format.html #index.html.haml
      format.json { render json:@orders }
    end
  end

  def new
  	@cart = current_cart
  	if @cart.line_items.empty?
  	  redirect_to store_url, notice: "Ваша карзина пуста!!! прежде чем оформлять заказ добавтье товар "
  	  return
  	end
  	@order = Order.new
  	new! do|format|
  	  format.html #new.html
  	  format.json {render json: @order}
  	end
  	
  end

  def create
    
    @order = Order.new(permitted_params)
    @order.add_line_items_from_cart(current_cart)

    create! do |format|
      if @order.save
        Cart.destroy(session[:cart_id])
        session[:cart_id] = nil
        OrderNotifier.received(@order).deliver
        format.html {redirect_to store_url, notice:
           'Спасибо за ваш заказ.'}
        format.json { render json: @order, status: :created,
             location: @order }
      else
        @cart = current_cart
        format.html { render action: "new" }
        format.json { render json:@order.errors,
             status: unprocessable_entity }

      end
    end

  end

  private
  def currcart
    @cart = current_cart
  end
  def set_order
     @order = Order.find(params[:id])
  end
  def permitted_params
     params.require(:order).permit(:name, :address, :email, :pay_type )
  end
end

class StoreController < ApplicationController
	#before_filter :authenticate_user! 
	before_action :cal
  def index
  	@products = Product.order(:title)
  	@time = Time.now
  	@count = increment_counter
  	@cart = current_cart
  end

  def cal
     @category_meny = Category.all.where(:parent_id => nil)
  end
end

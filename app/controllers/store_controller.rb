class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
  	@time = Time.now
  	@count = increment_counter
  	@cart = current_cart
  end
end

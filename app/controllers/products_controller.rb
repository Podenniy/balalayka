class ProductsController < ApplicationController
  inherit_resources
  before_action :set_product, only: [:show, :edit, :update,  :destroy]
  before_action :currcart
  
  

  def who_bought
    @product = Product.find(set_product)
    respond_to do | format |
      format.atom
    end
  end
  protected
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end  
   # Never trust parameters from the scary internet, only allow the white list through.
    def permitted_params
      #[params.require(:product).permit(:title, :description, :image_url, :price)]
     #params.permit(:product => [:title, :description, :image_url, :price])
     params.permit(:product =>[:title, :description, :image_url, :price])
    end

    def currcart
     @cart = current_cart
    end
end

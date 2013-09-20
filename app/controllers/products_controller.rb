class ProductsController < ApplicationController

  inherit_resources
  load_and_authorize_resource
  before_filter :authenticate_user!
  
  
  before_action :set_product, only: [:show, :edit, :update,  :destroy]
  before_action :currcart
  before_action :cal
 #belongs_to :parent

  

  def who_bought
    @product = Product.find(set_product)
    respond_to do | format |
      format.atom
    end
  end
  

  def new
    5.times{@product.assets.build}
  end
  
  protected


    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end  
   


    def permitted_params
     params.permit(:product =>[:title, :description, :image_url, :price, :category_id , :parent, :category, :brend_id, assets_attributes: [:image]])
    end

    def currcart
     @cart = current_cart
    end

    def cal
      @category_meny =Category.all.where(:parent_id => nil)
    end


    
end

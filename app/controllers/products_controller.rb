class ProductsController < ApplicationController
  inherit_resources
  before_action :set_product, only: [:show, :edit, :update,  :destroy]
  respond_to :html, :xml, :json
  
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
end

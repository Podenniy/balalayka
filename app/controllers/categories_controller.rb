class CategoriesController < InheritedResources::Base
	before_action :cal
  before_action :currcart
   before_filter :authenticate_user!
   skip_load_and_authorize_resource


   def index
   	@category = nil

   	@categories = Category.find(:all, :conditions =>{:parent_id => nil})
   	
   end

   def show
   	 @category = Category.find(params[:id])

   	 @categories = @category.children
   end


  def new
  	@category = Category.new
    @category.parent = Category.find(params[:id]) unless params[:id].nil?
  end

	def currcart
  	  @cart = current_cart
    end
    
  def permitted_params
   params.permit(:category => [:name, :category_id, :parent,  :parent_id , :children ,:product_id])
  end

  def cal
     @category_meny = Category.all.where(:parent_id => nil)
  end
end

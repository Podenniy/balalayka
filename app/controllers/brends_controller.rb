class BrendsController < InheritedResources::Base
   before_filter :authenticate_user!
   skip_load_and_authorize_resource

   before_action :cal
  before_action :currcart


  def currcart
  	  @cart = current_cart
    end
  def permitted_params
   params.permit(:brend => [:title, :category_id, :discription, :image_url])
  end

  def cal
   @category_meny = Category.all.where(:parent_id => nil)
  end
end

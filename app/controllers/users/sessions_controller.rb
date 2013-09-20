class Users::SessionsController < Devise::SessionsController
  before_action :cal
  def resource_params
    params.permit(:user).permit(:name, :email, :password, :role_ids)
  end

  
  private :resource_params

   def cal
     @category_meny = Category.all.where(:parent_id => nil)
   end
end
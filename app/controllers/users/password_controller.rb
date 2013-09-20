class Users::PasswordsController < Devise::PasswordsController
 before_action :cal
 def resource_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation, :role_ids)
 end
 private :resource_params

   def cal
     @category_meny = Category.all.where(:parent_id => nil)
   end
end
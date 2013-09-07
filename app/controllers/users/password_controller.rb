class Users::PasswordsController < Devise::PasswordsController
 def resource_params
   params.require(:user).permit(:name, :email, :password, :password_confirmation, :role_ids)
 end
 private :resource_params
end
class Users::RegistrationsController < Devise::RegistrationsController
	#before_filter :check_permissions, :only => [:new, :create, :cancel]
	#skip_before_filter :require_no_authentication

  #def check_permissions
   # authorize! :create, resource
  #end
  def resource_params
    params.require(:user).permit( :name, :email, :password, :password_confirmation, :password, :password_confirmation,  :role_ids)
  end
  private :resource_params


end
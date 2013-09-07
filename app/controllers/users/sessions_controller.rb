class Users::SessionsController < Devise::SessionsController
  def resource_params
    params.permit(:user).permit(:name, :email, :password, :role_ids)
  end
  private :resource_params
end
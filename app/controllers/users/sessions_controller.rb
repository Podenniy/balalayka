class Users::SessionsController < Devise::SessionsController
  def resource_params
    params.permit(:user).permit(:name, :email, :password)
  end
  private :resource_params
end
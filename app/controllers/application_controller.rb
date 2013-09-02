class ApplicationController < ActionController::Base
  protect_from_forgery 
  before_filter :configure_premited_parameters, if: :devise_controller?
  

  protected
  def configure_premited_parameters
    devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password, :password_confirmation)}
  end
  private
    def current_cart
    	Cart.find(session[:cart_id])
    rescue ActiveRecord::RecordNotFound
    	cart = Cart.create
    	session[:cart_id] = cart.id
      cart
    end
  
  
    def increment_counter
        if session[:counter].nil?
          session[:counter] =0
        end
        session[:counter] +=1
    end
end

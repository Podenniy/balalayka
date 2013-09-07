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
    rescue_from CanCan::AccessDenied do |exception|
        flash[:error] = exception.message
        redirect_to store_url
    end
  
    def increment_counter
        if session[:counter].nil?
          session[:counter] =0
        end
        session[:counter] +=1
    end

    def role?(role)
      return !!self.roles.find_by_name(role.to_s.camelize)
    end

    
 
   def menu
     categories = Category.all.where(:parent_id => nil)
     categories
   end
       
   
    

end

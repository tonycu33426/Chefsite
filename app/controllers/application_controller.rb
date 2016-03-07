class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :find_categories, :find_foodtypes

  
  before_filter :configure_permitted_parameters, if: :devise_controller?
  
  def initialize_cart
      @cart = Cart.build_from_hash session
  end
  
  def find_categories
      @categories = Category.all
  end
  
  def find_foodtypes
      @foodtypes = Foodtype.all
  end
  
  def authenticate_admin!
      authenticate_user!
      
      unless current_user.admin?
          redirect_to root_path, alert: "You are not allowed to perform that operation"
      end
  end
  
  protected
  
  def configure_permitted_parameters
      devise_parameter_sanitizer.for(:sign_up) { |u| u.permit(:name, :email, :password) }
      devise_parameter_sanitizer.for(:account_update) { |u| u.permit(:name, :email, :password, :current_password, :is_female, :date_of_birth) }
  end
  
end

class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

    # rescue_from CanCan::AccessDenied do |exception|
    #   flash[:warning] = exception.message
    #   redirect_to root_path
    # end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :image, :role, :subscribed, :billing_address_attributes => [:street, :city, :state, :pincode, :country],
      :mailing_address_attributes => [:street, :city, :state, :pincode, :country]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :image, :role, :subscribed, :billing_address_attributes => [:street, :city, :state, :pincode, :country],
      :mailing_address_attributes => [:street, :city, :state, :pincode, :country]])
  end
end

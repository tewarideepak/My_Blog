class ApplicationController < ActionController::Base
    before_action :configure_permitted_parameters, if: :devise_controller?

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:username, :image, :billing_address_attributes => [:street, :city, :state, :pincode, :country],
      :mailing_address_attributes => [:street, :city, :state, :pincode, :country]])
    devise_parameter_sanitizer.permit(:account_update, keys: [:username, :image, :billing_address_attributes => [:street, :city, :state, :pincode, :country],
      :mailing_address_attributes => [:street, :city, :state, :pincode, :country]])
  end
end

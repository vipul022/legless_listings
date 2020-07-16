class ApplicationController < ActionController::Base
  rescue_from CanCan::AccessDenied do |exception|
     flash[:authorization_error] = "Not authorized to perform that action ❌"
     redirect_to listings_path
   end 
  
  private

  # Overwriting the sign_out redirect path method
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path
  end
end

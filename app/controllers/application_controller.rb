class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  
  private

   def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
   end

   def basic_auth
    authenticate_or_request_with_http_basic_ do |username, password|
      username == 'yohey' && password == '2600'
   end
  end  
end

class ApplicationController < ActionController::Base
     # Prevent CSRF attacks by raising an exception.
     # For APIs, you may want to use :null_session instead.
     protect_from_forgery with: :null_session
     skip_before_action :verify_authenticity_token
     respond_to :json

     before_action :configure_permitted_parameters, if: :devise_controller?
     before_action :authenticate_user
 


    def index
      render template: 'application'
    end

#     protected

#          def configure_permitted_parameters
#               devise_parameter_sanitizer.permit(:sign_up) { |u| u.permit(:first_name, :last_name, :phone_number, :address, :email, :password)}

#               devise_parameter_sanitizer.permit(:account_update) { |u| u.permit(:first_name, :last_name, :phone_number, :email, :password, :current_password)}
#          end
       

     private

     def configure_permitted_parameters
          devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name])
     end
end

private

def configure_permitted_parameters
  devise_parameter_sanitizer.for(:sign_up) << :first_name
end

def authenticate_user
  if request.headers['Authorization'].present?
    authenticate_or_request_with_http_token do |token|
      begin
        jwt_payload = JWT.decode(token, Rails.application.secrets.secret_key_base).first

        @current_user_id = jwt_payload['id']
      rescue JWT::ExpiredSignature, JWT::VerificationError, JWT::DecodeError
        head :unauthorized
      end
    end
  end
end

def authenticate_user!(options = {})
     head :unauthorized unless signed_in?
   end
 
   def current_user
     @current_user ||= super || User.find(@current_user_id)
   end
 
   def signed_in?
     @current_user_id.present?
   end
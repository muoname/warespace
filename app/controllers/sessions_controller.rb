class SessionsController < Devise::SessionsController
  skip_before_action :verify_authenticity_token

    def index
        render json: User.all.to_json(:only => [ :id, :first_name, :last_name, :address, :phone_number])
    end

    def create
      user = User.find_by_email(sign_in_params[:email])
  
      if user && user.valid_password?(sign_in_params[:password])
        @current_user = user
      else
        render json: { errors: { 'email or password' => ['is invalid'] } }, status: :unprocessable_entity
      end
    end
  end
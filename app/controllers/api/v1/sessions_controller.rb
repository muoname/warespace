class Api::V1::SessionsController < ApplicationController
    skip_before_action :verify_authenticity_token

    def index
        render json: User.all.to_json(:only => [ :id, :first_name, :last_name, :address, :phone_number])
    end

    def show
        current_user ? head(:ok) : head(:unauthorized)
    end

    def create
        @user = User.where(email: params[:email]).first
        
        #verify user
        if @user&.valid_password?(params[:password])
            jwt = JWT.encode(
                {user_id: @user.id, exp: (Time.now + 2.weeks).to_i}, 
                Rails.application.secrets.secret_key_base,
                'HS256'
            ) 
            # render json: user.as_json(only: [:email, :first_name, :last_name, :address, :phone_number]), locals: { token: jwt }, status: :created
            render :create, locals: { token: jwt }, status: :created
        else
            head(:unauthorized)
        end

    end

    # def destroy
    #     @current_user&.token = nil
    #     if @current_user.save
    #         head(:no_content)
    #     else
    #         head(:unauthorized)
    #     end
    # end

    # def respond_to_on_destroy
    #     log_out_success && return if current_user
    
    #     log_out_failure
    #   end
    
    #   def log_out_success
    #     render json: { message: 'You are logged out.' }, status: :ok
    #   end
    
    #   def log_out_failure
    #     render json: { message: 'Hmm nothing happened.' }, status: :unauthorized
    #   end
    # end
end
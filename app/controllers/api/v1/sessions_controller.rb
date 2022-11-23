class Api::V1::SessionsController < ApplicationController

    skip_before_action :verify_authenticity_token
    def index
        render json: User.all.to_json(:only => [ :id, :first_name, :last_name, :address, :phone_number])
    end

    def show
        render json: @session
    end

    def create
        user = User.where(email: params[:email]).first

        if user.valid_password?(params[:password])
            render json: user.as_json(only: [:id, :email]), status: :created
        else
            head(:unauthorized)
        end

    end

    def destroy
        
    end
end
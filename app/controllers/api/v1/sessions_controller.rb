class Api::V1::SessionsController < ApplicationController


    def index
        render json: User.all.to_json(:only => [ :id, :first_name, :last_name, :address, :phone_number])
    end

    def show
        render json: @session
    end
end
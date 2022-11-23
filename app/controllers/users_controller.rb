class UsersController < ApplicationController
    before_action :authenticate_user!


    def index
      render json: User.all.to_json(:only => [ :id, :first_name, :last_name, :address, :phone_number])
  end

    def show
      render json: @user
    end

    def update
      if current_user.update_attributes(user_params)
        render :show
      else
        render json: { errors: current_user.errors }, status: :unprocessable_entity
      end
    end
    
    private

    def user_params
      params.require(:user).permit(:first_name, :last_name,:email, :password, :address, :phone_number)
    end

end
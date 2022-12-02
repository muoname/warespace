class Api::V1::UsersController < ApplicationController

def update_info
    @user = User.find(params[:id])
    if @user.update(user_params)
        render :show status: :ok
    else
        render json: @users.errors, status: :unprocessable_entity
    end
  end
end

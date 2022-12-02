class UsersController < ApplicationController

def update_info
    @user = User.find(params[:id])
    @user.is_renter = params[:is_renter]
    if @user.save
        render json: @user
    else
        render json:     @user.errors
    end
  end
end

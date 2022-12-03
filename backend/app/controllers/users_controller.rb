class UsersController < ApplicationController

def switch
    @user = User.find(params[:id])
    @user.is_renter = params[:is_renter]
    if @user.save
        render json: @user
    else
        render json: @user.errors
    end
end
def update
    @user = User.find(params[:id])
    @user.first_name = params[:first_name]
    @user.last_name = params[:last_name]
    @user.phone_number = params[:phone_number]
    @user.email = params[:email]
    @user.password = params[:password]
    @user.address = params[:address]
    if @user.save
        render json: @user
    else
        render json: @user.errors
    end
  end
def show
    @user = User.find(params[:id])
    render json: @user
  end
end
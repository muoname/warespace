class Api::V1::MapsController < ApplicationController
  def home
  end

  def show
  end
  
  def index
    # @spaces = Space.all
    # current_user.latitude = 123.778
    # current_user.longitude = 13.1227.778
    # me = current_user
    # @user = User.find(params[:id])
    # c = User.find(me)
    # @user_addr = @user.address

    @spaces = Space.near(params[:address], 10, units: :km)  
    render json: @spaces
    # puts @spaces

  end

end

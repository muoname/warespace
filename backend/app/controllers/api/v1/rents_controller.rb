class Api::V1::RentsController < ApplicationController
  before_action :set_rent, only: %i[ show update destroy ]

  def show_rents
    @rents = Rent.where('space_id LIKE ?', params[:search_id])

    render json: @rents
  end

  # GET /rents
  # GET /rents.json
  def index

    @rents = Rent.all

    render json: @rents.to_json(include: { user: { only: [:first_name, :last_name, :phone_number, :address] }, })

  end

  # GET /rents/1
  # GET /rents/1.json
  def show
    render json: @rent.to_json(include: { user: { only: [:first_name, :last_name, :phone_number, :address] } })
  end

  # POST /rents
  # POST /rents.json
  def create
    @rent = Rent.new(rent_params)

    if @rent.save
      render json: @rent
    else
      render json: @rent.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /rents/1
  # PATCH/PUT /rents/1.json
  def update
    if @rent.update(rent_params)
      render json: @rent
    else
      render json: @rent.errors, status: :unprocessable_entity
    end
  end

  # DELETE /rents/1
  # DELETE /rents/1.json
  def destroy
    @rent.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rent
      @rent = Rent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rent_params
      params.require(:rent).permit(:user_id, :space_id, :start_date, :end_date)
    end
end

class Api::V1::RentsController < ApplicationController
  before_action :set_rent, only: %i[ show edit update destroy ]

  # GET /rents or /rents.json
  def index
    @rents = Rent.all

    render json: @rents
  end

  # GET /rents/1 or /rents/1.json
  def show
  end

  # GET /rents/new
  def new
    @rent = Rent.new
  end

  # GET /rents/1/edit
  def edit
  end

  # POST /rents or /rents.json
  def create
    @rent = Rent.new(rent_params)
    @rent.user_id = current_user.id

    respond_to do |format|
      if @rent.save
        format.html { redirect_to "/spaces/" + @rent.space_id.to_s, notice: "Reservation is successful" }
        format.json { render :show, status: :created, location: @rent }
      else
        format.html { redirect_to "/spaces/" + @rent.space_id.to_s, notice: "Reservation attempt is unsuccessful" }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /rents/1 or /rents/1.json
  def update
    respond_to do |format|
      if @rent.update(rent_params)
        format.html { redirect_to rent_url(@rent), notice: "Rent was successfully updated." }
        format.json { render :show, status: :ok, location: @rent }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @rent.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rents/1 or /rents/1.json
  def destroy
    @rent.destroy

    respond_to do |format|
      format.html { redirect_to rents_url, notice: "Rent was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_rent
      @rent = Rent.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def rent_params
      params.require(:rent).permit(:user_id, :space_id, :duration)
    end
end

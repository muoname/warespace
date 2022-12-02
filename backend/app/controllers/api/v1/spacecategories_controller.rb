class Api::V1::SpacecategoriesController < ApplicationController
  before_action :set_spacecategory, only: %i[ show edit update destroy ]

  # GET /spacecategories or /spacecategories.json
  def index
    @spacecategories = Spacecategory.all

    render json: @spacecategories
  end

  # GET /spacecategories/1 or /spacecategories/1.json
  def show
    render json: @spacecategory
  end

  # GET /spacecategories/new
  def new
    @spacecategory = Spacecategory.new
  end

  # GET /spacecategories/1/edit
  def edit
  end

  # POST /spacecategories or /spacecategories.json
  def create
    @spacecategory = Spacecategory.new(spacecategory_params)

    respond_to do |format|
      if @spacecategory.save
        format.html { redirect_to spacecategory_url(@spacecategory), notice: "Spacecategory was successfully created." }
        format.json { render :show, status: :created, location: @spacecategory }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @spacecategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /spacecategories/1 or /spacecategories/1.json
  def update
    respond_to do |format|
      if @spacecategory.update(spacecategory_params)
        format.html { redirect_to spacecategory_url(@spacecategory), notice: "Spacecategory was successfully updated." }
        format.json { render :show, status: :ok, location: @spacecategory }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @spacecategory.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /spacecategories/1 or /spacecategories/1.json
  def destroy
    @spacecategory.destroy

    respond_to do |format|
      format.html { redirect_to spacecategories_url, notice: "Spacecategory was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_spacecategory
      @spacecategory = Spacecategory.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def spacecategory_params
      params.require(:spacecategory).permit(:category_name)
    end
end

class Api::V1::SpacesController < ApplicationController
  before_action :set_space, only: %i[ show edit update destroy ]

  def search
    @spaces = Space.where(location: params[:search_string]).or(Space.where(title: params[:search_string]))

    render json: @spaces
  end

  def myspaces     
    @spaces = Space.where('user_id LIKE ?', params[:search_id])
    
    render json: @spaces
  end

  # GET /spaces or /spaces.json
  def index
    @spaces = Space.all

    render json: @spaces.to_json(include: { user: { only: [:first_name, :last_name, :phone_number, :address] } })
  end 
  # GET /spaces/1 or /spaces/1.json
  def show

    render json: @space.to_json(include: { user: { only: [:first_name, :last_name, :phone_number, :address] } })

  end

  # GET /spaces/new
  def new
    @space = Space.new
    render json: @space
  end

  # GET /spaces/1/edit
  def edit
  end

  # POST /spaces or /spaces.json
  def create
    puts params
    @space = Space.new(space_params)
      if @space.save
        render json: @space
      else
        render json: @space.errors, status: :unprocessable_entity
      end
  end

  # PATCH/PUT /spaces/1 or /spaces/1.json
  def update
    @space = Space.find(params[:id])
    @space.spacecategory_id = params[:spacecategory_id]
    @space.title = params[:title]
    @space.location = params[:location]
    @space.description = params[:description]
    @space.space_size = params[:space_size]
    @space.weekly_rate = params[:weekly_rate]
    @space.longitude = params[:longitude]
    @space.latitude = params[:latitude]
    @space.space_policies = params[:space_policies]
    @space.street = params[:street]
    @space.city = params[:city]
    @space.zipcode = params[:zipcode]
    @space.province = params[:province]
    

    if @space.save
      render json: @space
    else
      render json: @space.errors
    end
  end

  # DELETE /spaces/1 or /spaces/1.json
  def destroy
    @space.destroy

    respond_to do |format|
      format.html { redirect_to spaces_url, notice: "Space was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_space
      @space = Space.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def space_params
      params.permit(:user_id, :spacecategory_id, :title, :location, :description, :space_size, :weekly_rate, :longitude, :latitude, :space_policies, :image, :street, :city, :zipcode, :province, pictures: [] )
    end
end

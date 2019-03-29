class VehiclesController < ApplicationController
  before_action :set_vehicle, only: [:show, :edit, :update, :destroy]

  # GET /vehicles
  def index
    @vehicles = Vehicle.all
  end

  # GET /vehicles/1
  def show
  end

  # GET /vehicles/new
  def new
    @vehicle = Vehicle.new
  end

  # GET /vehicles/1/edit
  def edit
  end

  # POST /vehicles
  def create
    @vehicle = Vehicle.new(vehicle_params)

    if @vehicle.save
      redirect_to vehicles_path, notice: "Vehicle was created successfully"
    else
      render :new
    end
    veh_class = @vehicle.veh_class
    @vehicle.drivers << Driver.where(licence_class: veh_class)
  end

  # PATCH/PUT /vehicles/1
  def update
    if @vehicle.update(vehicle_params)
      redirect_to vehicles_path, notce: 'Vehicle successfully updated'
    else
      render 'edit'
    end
  end

  # DELETE /vehicles/1
  def destroy
    if @vehicle.destroy
      redirect_to vehicles_path, notice: 'Vehicle successfully deleted'
    else
      redirect_to vehicles_path, alert: 'Vehicle deletion failed, please try again!'
    end
  end

  def assign_driver
    @vehicles = Vehicle.all
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vehicle
      @vehicle = Vehicle.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vehicle_params
      params.require(:vehicle).permit(:make, :model, :variant, :year, :veh_class, :capacity, :vahicle_number, :imageUrl, :driver_id)
    end
end

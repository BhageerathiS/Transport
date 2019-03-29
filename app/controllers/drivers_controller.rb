class DriversController < ApplicationController
  before_action :set_driver, only: [:show, :edit, :update, :destroy]

  # GET /drivers
  def index
    @drivers = Driver.all
  end

  # GET /drivers/1
  def show
  end

  # GET /drivers/new
  def new
    @driver = Driver.new
  end

  # GET /drivers/1/edit
  def edit
  end

  # POST /drivers
  def create
    @driver = Driver.new(driver_params)

    if @driver.save
      redirect_to drivers_path, notice: "Driver was created successfully"
    else
      render :new
    end
    licence_class = @driver.licence_class
    @driver.vehicles << Vehicle.where(veh_class: licence_class)
  end

  # PATCH/PUT /drivers/1
  def update
    if @driver.update(driver_params)
      redirect_to drivers_path, notce: 'Driver successfully updated'
    else
      render 'edit'
    end
  end

  # DELETE /drivers/1
  def destroy
    if @driver.destroy
      redirect_to drivers_path, notice: 'Driver successfully deleted'
    else
      redirect_to drivers_path, alert: 'Driver deletion failed, please try again!'
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_driver
      @driver = Driver.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def driver_params
      params.require(:driver).permit(:name, :dob, :licence_class, :issue_date, :licence_number, :vehicle_id)
    end
end

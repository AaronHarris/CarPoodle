class DriversController < ApplicationController

  before_filter :get_event, :except => [:index]

  # GET /drivers
  # GET /drivers.json
  def index
    @drivers = Driver.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @drivers }
    end
  end

  # GET /drivers/1
  # GET /drivers/1.json
  def show
    @driver = Driver.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @driver }
    end
  end

  # GET /drivers/new
  # GET /drivers/new.json
  def new
    @driver = Driver.new(:event_id => params[:event_id])

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @driver }
    end
  end

  # GET /drivers/1/edit
  def edit
    #@driver = Driver.find(params[:id])
    @driver = @event.drivers.find(params[:id])
  end

  # POST /drivers
  # POST /drivers.json
  def create
    @driver = @event.drivers.new(params[:driver])

    respond_to do |format|
      if @driver.save

        for i in 1..@driver.spots do
          @waitlistrider = @event.riders.find_by_waitlist(true)
          @waitlistrider.update_driver(@driver.id) if @waitlistrider
          @waitlistrider.update_waitlist if @waitlistrider
        end

        @driver.update_full

        format.html { redirect_to [@event, @driver], notice: 'Driver was successfully created.' }
        format.json { render json: @driver, status: :created, location: @driver }
      else
        format.html { render action: "new" }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /drivers/1
  # PUT /drivers/1.json
  def update
    #@driver = Driver.find(params[:id])
    @driver = @event.drivers.find(params[:id])

    respond_to do |format|
      if @driver.update_attributes(params[:driver])
        format.html { redirect_to [@event, @driver], notice: 'Driver was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @driver.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drivers/1
  # DELETE /drivers/1.json
  def destroy
    @driver = Driver.find(params[:id])
    @driver.destroy

    respond_to do |format|
      format.html { redirect_to drivers_url }
      format.json { head :no_content }
    end
  end

  def get_event
    @event = Event.find(params[:event_id])
  end

end

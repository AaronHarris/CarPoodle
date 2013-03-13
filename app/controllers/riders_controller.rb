class RidersController < ApplicationController

  before_filter :get_event, :except => [:index]
  before_filter :get_opendriver, :except => [:index, :show]

  # GET /riders
  # GET /riders.json
  def index
    @riders = Rider.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @riders }
    end
  end

  # GET /riders/1
  # GET /riders/1.json
  def show
    @rider = Rider.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rider }
    end
  end

  # GET /riders/new
  # GET /riders/new.json
  def new
    #@event = Event.find(params[:id])
    #@rider = Rider.new
    @rider = Rider.new(:event_id => params[:event_id])
    #@drivers = @event.drivers

    #@rider.driver_id = @opendriver.id

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rider }
    end
  end

  # GET /riders/1/edit
  def edit
    @rider = @event.riders.find(params[:id])
  end

  # POST /riders
  # POST /riders.json
  def create
    @rider = @event.riders.new(params[:rider])
    @rider.driver_id = @opendriver.id

    respond_to do |format|
      if @rider.save
        format.html { redirect_to [@event, @rider], notice: 'Rider was successfully created.' }
        format.json { render json: @rider, status: :created, location: @rider }
      else
        format.html { render action: "new" }
        format.json { render json: @rider.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /riders/1
  # PUT /riders/1.json
  def update
    #@rider = Rider.find(params[:id])
    @rider = @event.riders.find(params[:id])

    respond_to do |format|
      if @rider.update_attributes(params[:rider])
        format.html { redirect_to [@event, @rider], notice: 'Rider was successfully updated.' }
        format.json { head :no_content }
        format.js { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rider.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /riders/1
  # DELETE /riders/1.json
  def destroy
    @rider = Rider.find(params[:id])
    @rider.destroy

    respond_to do |format|
      format.html { redirect_to riders_url }
      format.json { head :no_content }
    end
  end

  def get_event
    @event = Event.find(params[:event_id])
  end

  def get_opendriver
    @drivers = @event.drivers
    @opendrivers = for d in @drivers
                      d.spots > d.riders.size
                    end
    @opendriver = @opendrivers.first
  end

end

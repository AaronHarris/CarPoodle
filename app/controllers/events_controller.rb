class EventsController < ApplicationController
  # GET /events
  # GET /events.json
  def index
    @events = Event.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @drivers = Driver.where(event_id: @event)
    @riders = Rider.where(driver_id: @drivers)
    @waitlists = @event.riders.where(waitlist: true)
    #@riders = Rider.where(event_id: @event)

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @event }
    end
  end

  # GET /events/new
  # GET /events/new.json
  def new
    @event = Event.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @event }
    end

    # render :action => 'new'
  end

  def newuser
    @event = Event.find(params[:id])

    respond_to do |format|
      format.html # newuser.html.erb
      format.json {render json: @events}
    end
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])
    @event.admin_key = SecureRandom.hex(4)
    
    respond_to do |format|
      if @event.save

        UserMailer.event_confirmation(@event).deliver

        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render json: @event, status: :created, location: @event }
      else
        format.html { render action: "new" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /events/1
  # PUT /events/1.json
  def update
    @event = Event.find(params[:id])

    respond_to do |format|
      if @event.update_attributes(params[:event])
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event = Event.find(params[:id])
    @event.destroy

    respond_to do |format|
      format.html { redirect_to events_url }
      format.json { head :no_content }
    end
  end

  def admin 
    @event = Event.find(params[:id])
    # @adminkey = Event.find(admin_key: params[:adminkey])

    respond_to do |format|
      if (params[:adminkey] == @event.admin_key)
        format.html { render action: "admin" }
      else
        #puts "routing errorrrrrr"
        raise ActionController::RoutingError.new('Not Found')
      end
    end
  end

  def adminsubmit
    @event = Event.find(params[:id])

    respond_to do |format|
      if (params[:admin_key] == @event.admin_key) 
        format.html { redirect_to "/events/#{params[:id]}/#{@event.admin_key}"}
      else
        format.html { render action: "edit" }
      end
    end
  end


end

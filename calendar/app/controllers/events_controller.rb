class EventsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_event, only: [:show, :edit, :update, :destroy]

  # GET /events
  # GET /events.json
  def index
    @events = Event.all.order(start_time: :desc)
  end

  def list
    @user_events = current_user.events

  end

  def list_ajax
    if params[:start_time] == '0'
      @user_events = current_user.events
    elsif params[:start_time] == 'future'
      @user_events = current_user.events.future_events(params[:start_time]) if params[:start_time]
      p @user_events
    else
      @user_events = current_user.events.prev_events(params[:start_time]) if params[:start_time]
      p @user_events
    end
    respond_to do |format|
      format.js
    end
  end



  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
    @user_event = current_user.events.new
    @user_event.start_time = params[:date]
  end
  # GET /events/1/edit
  def edit
    @user_event = current_user.events.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = current_user.events.new(event_params)

    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to my_events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_event
      @event = Event.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :body, :start_time, :user_id)
    end
end

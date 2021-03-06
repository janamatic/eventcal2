class EventsController < ApplicationController
  # GET /events
  # GET /events.json

before_filter :authenticate_user!, :except => [:show,:index]

  def index



    @events = []
    @all_events= Event.all

  if params[:tag]

    @all_tag_events = Event.tagged_with(params[:tag])

    if params[:day] and params[:year] and params[:month] 

    for e in @all_tag_events do
        if e.event_date.try(:day).try(:to_s)==params[:day] and e.event_date.try(:month).try(:to_s)==params[:month] and e.event_date.try(:year).try(:to_s)==params[:year] 
          @events << e
        end
    end
   else  



    @events = Event.tagged_with(params[:tag])



end




  else





    if params[:day] and params[:year] and params[:month] 

    for e in @all_events do
        if e.event_date.try(:day).try(:to_s)==params[:day] and e.event_date.try(:month).try(:to_s)==params[:month] and e.event_date.try(:year).try(:to_s)==params[:year] 
          @events << e
        end
    end
   else  

   if params[:search]

     @events=Event.tagged_with(params[:search])+Event.where("title LIKE ?", '%' + params[:search] + '%') + Event.where("description LIKE ?", '%' + params[:search] + '%')
     @events=@events.uniq
    elsif params[:tags]

        @events=Event.tagged_with(params[:tags])
    else

      for e in @all_events do
        if e.event_date.try(:day).try(:to_s)==Date.today.day and e.event_date.try(:month).try(:to_s)==Date.today.month and e.event_date.try(:year).try(:to_s)==Date.today.year 
          @events << e
        end
    end


   end


end
end



    @json = @events.to_gmaps4rails

   

  @date = params[:date] ? Date.parse(params[:date]) : Date.today
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @events }
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
    @event = Event.find(params[:id])
    @json = @event.to_gmaps4rails
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
  end

  # GET /events/1/edit
  def edit
    @event = Event.find(params[:id])
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(params[:event])

    respond_to do |format|
      if @event.save
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
end

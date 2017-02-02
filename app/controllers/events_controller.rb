class EventsController < ApplicationController
  def new
    @event = Event.new
    @event.start_time = start_date
  end

  def edit
    @event = Event.find(params[:id])
    @event.start_time = @event.start_time.strftime("%d/%m/%Y")
    @event.end_time = @event.end_time.strftime("%d/%m/%Y")
  end

  def create
    @event = Event.new(event_params)
    @event.color = "%06x" % (rand * 0xffffff)
    
    if @event.save
      redirect_to root_url
    else
      render "new"
    end
  end

  def update
    @event = Event.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to root_url
    else
      render "edit"
    end
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_time, :end_time)
  end

  def start_date
    start_date = params[:start_date] || Date.today.to_s
    Date.parse(start_date).strftime("%d/%m/%Y")
  end
end

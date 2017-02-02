class EventsController < ApplicationController
  def new
    @event = Event.new
    @default_start_date = start_date
  end

  def create
    @event = Event.new(event_params)
    
    if @event.save
      redirect_to root_url
    else
      render "new"
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

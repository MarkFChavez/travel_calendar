class EventsController < ApplicationController
  def new
    @event = Event.new

    # set initial dates
    @event.start_time = start_date
    @event.end_time = start_date
  end

  def edit
    # event
    @event = current_user.events.find(params[:id])
    @event.start_time = @event.start_time.strftime("%d/%m/%Y")
    @event.end_time = @event.end_time.strftime("%d/%m/%Y")

    # notes
    @notes = @event.notes.order(created_at: :desc)
  end

  def create
    @event = CreateEvent.new(current_user, event_params)
    @event = @event.call

    redirect_to root_url(start_date: @event.calendar_friendly_start_time)

  rescue CreateEvent::NotValidEventException => e
    redirect_to root_url
  end

  def update
    @event = current_user.events.find(params[:id])

    if @event.update_attributes(event_params)
      redirect_to root_url(start_date: @event.calendar_friendly_start_time)
    else
      render "edit"
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    @event.destroy

    redirect_to root_url(start_date: @event.calendar_friendly_start_time)
  end

  private

  def event_params
    params.require(:event).permit(:name, :description, :start_time, :end_time, :color)
  end

  def start_date
    start_date = params[:start_date] || Date.today.to_s
    Date.parse(start_date).strftime("%d/%m/%Y")
  end
end

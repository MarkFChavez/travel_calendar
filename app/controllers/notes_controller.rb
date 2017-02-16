class NotesController < ApplicationController
  
  def new
    @event = find_event
    @note = Note.new
  end

  def create
    @event = find_event

    @note = Note.new(resource: @event, content: note_params[:content])
    @note.save!

    redirect_to edit_event_url(@event)
  end

  private

  def find_event
    Event.find(params[:event_id])
  end

  def note_params
    params.require(:note).permit(:content)
  end
end

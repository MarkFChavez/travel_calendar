class NotesController < ApplicationController
  
  def new
    @event = event
    @note = Note.new
  end

  def edit
    @event = event
    @note = @event.notes.find(params[:id])
  end

  def create
    @note = Note.new(note_params)
    @note.resource = event
    @note.save!

    redirect_to edit_event_url(event)
  end

  def update
    @note = event.notes.find(params[:id])
    @note.update!(note_params)

    redirect_to edit_event_url(event)
  end
  
  def destroy
    @note = Note.find(params[:id])
    @note.destroy!

    redirect_to edit_event_url(event)
  end

  private

  def note_params
    params.require(:note).permit(:content, :attachment)
  end

  def event
    Event.find(params[:event_id])
  end
end

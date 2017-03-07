class Users::NotesController < ApplicationController

  def index
    @notes = current_user.notes.order(updated_at: :desc)
  end

  def new
    @note = Note.new
  end

  def edit
    @note = current_user.notes.find(params[:id])
  end

  def update
    @note = current_user.notes.find(params[:id])
    @note.update!(note_params)

    redirect_to users_notes_url
  end

  def create
    @note = build_note
    @note.save!

    redirect_to users_notes_url
  end

  def destroy
    @note = current_user.notes.find(params[:id])
    @note.destroy!

    redirect_to users_notes_url
  end

  private

  def note_params
    params.require(:note).permit(:content, :attachment)
  end

  def build_note
    note = Note.new(note_params)
    note.resource = current_user

    note
  end

end

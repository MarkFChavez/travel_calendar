class CreateEvent

  class NotValidEventException < StandardError; end

  def initialize(user, attributes = {})
    @user = user
    @attributes = attributes
  end

  def call
    event = @user.events.build(@attributes)
    
    if event_form.valid? && event.save
      return event
    else
      raise NotValidEventException, event_form.errors.full_messages.to_sentence
    end
  end

  private

  def event_form
    CreateEventForm.new(@attributes)
  end

end

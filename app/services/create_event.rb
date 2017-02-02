class CreateEvent

  class NotValidEventException < StandardError; end

  def initialize(attributes = {})
    @attributes = attributes
  end

  def call
    event = Event.new(@attributes)
    event.color = generate_hex_color
    
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

  def generate_hex_color
    "%06x" % (rand * 0xffffff)
  end

end

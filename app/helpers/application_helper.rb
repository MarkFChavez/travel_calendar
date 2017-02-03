module ApplicationHelper
  def date_today
    Date.today.to_s
  end

  def popover_events_template(events)
    events.map do |event|
      "<div> #{fa_icon('calendar-o')} #{link_to(event.name, edit_event_path(event))} </div>"
    end.join(" ").html_safe
  end
end

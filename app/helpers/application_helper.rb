module ApplicationHelper
  def date_today
    Date.today.to_s
  end

  def popover_events_template(events)
    events.map do |event|
      "<div> #{fa_icon('calendar-o')} #{link_to(event.name, edit_event_path(event))} </div>"
    end.join(" ").html_safe
  end

  def markdown(text)
    options = {
      no_intra_emphasis: true,
      fenced_code_blocks: true,
      disable_indented_code_blocks: true,
      autolink: true,
      tables: true,
      underline: true,
      highlight: true
    }

    markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, options)
    markdown.render(text).html_safe
  end
end

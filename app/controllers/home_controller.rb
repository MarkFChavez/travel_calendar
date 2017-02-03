class HomeController < ApplicationController
  def index
    @events= current_user.events.where(start_time: safe_month_range)
  end

  private

  # This is so that all events should show on the calendar event if different
  # month
  def safe_month_range
    start_date = params[:start_date] || Date.today.to_s
    date = Date.parse(start_date)

    (date.beginning_of_month-5.days)..(date.end_of_month + 5.days)
  end
end

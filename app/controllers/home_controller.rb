class HomeController < ApplicationController
  def index
    @events= Event.where(created_at: start_date.beginning_of_month..start_date.end_of_month)
  end

  private

  def start_date
    start_date = params[:start_date] || Date.today.to_s
    Date.parse(start_date)
  end
end

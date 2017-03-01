class CreateEventForm
  include ActiveModel::Model

  attr_accessor :name, :start_time, :end_time, :color
  validates :name, :start_time, :end_time, :color, presence: true

  def initialize(attributes = {})
    @name = attributes[:name]
    @start_time = attributes[:start_time]
    @end_time = attributes[:end_time]
    @color = attributes[:color]
  end

end

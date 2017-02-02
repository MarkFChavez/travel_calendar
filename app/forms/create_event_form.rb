class CreateEventForm
  include ActiveModel::Model

  attr_accessor :name, :description, :start_time, :end_time
  validates :name, :start_time, :end_time, presence: true

  def initialize(attributes = {})
    @name = attributes[:name]
    @description = attributes[:description]
    @start_time = attributes[:start_time]
    @end_time = attributes[:end_time]
  end

end

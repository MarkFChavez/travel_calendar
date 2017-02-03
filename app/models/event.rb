class Event < ApplicationRecord

  belongs_to :user

  def calendar_friendly_start_time
    Date.parse(start_time.to_s).to_s
  end

  def to_param
    [id, name.parameterize].join("-")
  end

end

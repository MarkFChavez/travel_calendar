class Event < ApplicationRecord

  def calendar_friendly_start_time
    start_time.strftime("%Y-%m-%d")
  end

  def to_param
    [id, name.parameterize].join("-")
  end

end

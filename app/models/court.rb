class Court < ApplicationRecord
  has_many :bookings
  has_many :availabilities

  def available(start_time, end_time)
    availabilities.where('start_time >= ? AND end_time <= ?', start_time, end_time).present?
  end
end

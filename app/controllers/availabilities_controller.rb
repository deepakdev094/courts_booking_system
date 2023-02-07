class AvailabilitiesController < ApplicationController
  def index
    debugger
    date = params[:date] ? Time.zone.parse(params[:date]) : Time.zone.now
    availabilities = Availability.includes(:court).where(start_time: date.beginning_of_day..date.end_of_day)
    if params[:court_type].present?
      availabilities = availabilities.where(court: { type: params[:court_type] })
    end
    render json: { availabilities: availabilities }, status: :ok
  end
end

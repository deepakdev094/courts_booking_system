class BookingsController < ApplicationController
  def create
    court = Court.find(params[:court_id])
    start_time = Time.zone.parse("#{params[:date]} #{params[:start_time]}")
    end_time = start_time + 1.hour
    if !court.available(start_time,end_time)
      booking = court.bookings.create(start_time: start_time, end_time: end_time)
      court.availabilities.create(start_time: start_time, end_time: end_time)
      render json: { booking: booking }, status: :created
    else
      render json: { errors: 'Court not available' }, status: :unprocessable_entity
    end
  end

  def update
    booking = Booking.find(params[:id])
    booking.update(booking_params)
    render json: { booking: booking }, status: :ok
  end

  def destroy
    booking = Booking.find(params[:id])
    court = booking.court
    court.availabilities.find_by(start_time: booking.start_time, end_time: booking.end_time)&.destroy
    booking.destroy
    head :no_content
  end

  private

  def booking_params
    params.permit(:start_time, :end_time, :notes)
  end
end

class BookingsController < ApplicationController
  # New, Create, Edit, Destroy
  before_action :set_booking

  def create
    @booking = Booking.new(booking_params)
  end

  def destroy
    @booking.destroy
    redirect_to imaginary_friends_path, status: :see_other
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:user, :imaginary_friend, :approved)
  end
end

class BookingsController < ApplicationController
  # New, Create, Index
  # before_action :set_booking

  def create
    @booking = Booking.new(booking_params)
  end

  def index
    @bks = ImaginaryFriend.find(imaginary_friend_id).bookings if ImaginaryFriend.exists?(params[:imaginary_friend_id])
  end

  private

  def booking_params
    params.require(:booking).permit(:user, :imaginary_friend_id, :approved)
  end
end

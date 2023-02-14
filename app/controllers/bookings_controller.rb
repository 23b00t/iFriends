class BookingsController < ApplicationController
  # New, Create, Index
  # before_action :set_booking

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to imaginary_friend_path(:imaginary_friend_id), notice: "Booking requested."
    else
      redirect_to imaginary_friend_path(:imaginary_friend_id), alert: "Booking not possible."
    end
  end

  def show
    @bks = ImaginaryFriend.find(params[:imaginary_friend_id]).bookings if ImaginaryFriend.exists?(params[:imaginary_friend_id])
  end

  def accept
    @booking = Booking.find(params[:id])
    @booking.update(approved: :approved)
    redirect_to bookings_path, notice: "Booking request accepted."
  end

  def decline
    @booking = Booking.find(params[:id])
    @booking.update(approved: :denied)
    redirect_to bookings_path, alert: "Booking request denied."
  end

  def index
    @bookings = Booking.all.select { |booking| booking.imaginary_friend.user == current_user }
    @rents = Booking.all.select { |booking| booking.user == current_user }
  end

  def my_bookings_index
    # raise
    @bookings = Booking.all.select { |booking| booking.user == current_user }
  end

  def bookings_of_ifriends_index
    @bookings = Booking.all.select { |booking| booking.imaginary_friend.user == current_user }
  end

  private

  def booking_params
    params.require(:booking).permit(:user_id, :imaginary_friend_id, :start_date, :end_date)
  end
end

class PagesController < ApplicationController
  before_action :authenticate_user!


  def home
    @imaginary_friends = ImaginaryFriend.all.select { |m| m.user_id == current_user.id }
  end

  def rents
    bookings = Booking.all.select { |m| m.user_id == current_user.id }
    @rent_friends = bookings.map{ |booking| booking.imaginary_friend }
  end
end

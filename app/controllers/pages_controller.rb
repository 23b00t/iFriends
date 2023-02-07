class PagesController < ApplicationController
  before_action :authenticate_user!

  def home
    @imaginary_friends = ImaginaryFriend.all.select { |m| m.user_id == current_user.id }
  end

  def my_rents
    @rent_friends = Booking.all.select { |m| m.user_id == current_user.id }
  end
end

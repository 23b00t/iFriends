class ImaginaryFriendsController < ApplicationController
  before_action :set_ifriend, only: %i[show update destroy edit]

  def index
    #IN THE LIST OF ALL FRIENDS USER CAN SEE ONLY OTHER USERS FRIENDS
    @imaginary_friends = ImaginaryFriend.all.reject { |friend| friend.user_id == current_user.id }
  end

  def show
    @booking = Booking.new
    @bookings = Booking.where('imaginary_friend_id = ?', params[:id]).approved
    @disabled_dates = []
    @bookings.each do |booking|
      start_date = Date.parse(booking.start_date)
      end_date = Date.parse(booking.end_date)

      while start_date <= end_date
        @disabled_dates << start_date.to_s
        start_date += 1.day
      end
    end
  end

  def new
    @imaginary_friend = ImaginaryFriend.new
  end

  def create
    @imaginary_friend = ImaginaryFriend.new(ifriend_params)
    @imaginary_friend.user = current_user
    if @imaginary_friend.save
      redirect_to imaginary_friend_path(@imaginary_friend)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @imaginary_friend.update(ifriend_params)
      redirect_to imaginary_friend_path(@imaginary_friend)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @imaginary_friend.destroy
    redirect_to imaginary_friends_path, status: :see_other
  end

  private

  def set_ifriend
    @imaginary_friend = ImaginaryFriend.find(params[:id])
  end

  def ifriend_params
    params.require(:imaginary_friend).permit(:name, :description, :price, :special_abilities, :rented, :photo)
  end
end

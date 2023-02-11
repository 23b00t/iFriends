class ImaginaryFriendsController < ApplicationController
  before_action :set_ifriend, only: %i[show update destroy edit]

  def index
    @imaginary_friends = ImaginaryFriend.all

    @markers = @imaginary_friends.geocoded.map do |friend|
      {
        lat: friend.latitude,
        lng: friend.longitude
      }
    end
  end

  def show
    @booking = Booking.new
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

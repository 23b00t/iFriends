class ImaginaryFriendsController < ApplicationController
  before_action :set_ifriend, only: %i[show update destroy edit]

  def index
    @imaginary_friends = ImaginaryFriend.all

    @markers = @imaginary_friends.geocoded.map do |friend|
      {
        lat:  friend.latitude,
        lng: friend.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { friend: friend })
      }
    end
  end

  def my_friends_index
    @imaginary_friends = ImaginaryFriend.all.select { |friend| friend.user == current_user }
  end

  def show
    @booking = Booking.new
    @bookings = Booking.where('imaginary_friend_id = ?', params[:id]).approved
    # raise
    @disabled_dates = booked_dates
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

  def search
    ImaginaryFriend.reindex!
    @query = params[:query]
    @imaginary_friends = ImaginaryFriend.search(@query)
    @markers = @imaginary_friends.map do |friend|
      {
        lat:  friend.latitude,
        lng: friend.longitude,
        info_window_html: render_to_string(partial: "info_window", locals: { friend: friend })
      }
    end
  end

  private

  def set_ifriend
    @imaginary_friend = ImaginaryFriend.find(params[:id])
  end

  def ifriend_params
    params.require(:imaginary_friend).permit(:name, :description, :price, :special_abilities, :rented, :photo, :address)
  end

  def booked_dates
    disabled_dates = []
    @bookings.each do |booking|
      start_date = Date.parse(booking.start_date)
      end_date = Date.parse(booking.end_date)

      while start_date <= end_date
        disabled_dates << start_date.to_s
        start_date += 1.day
      end
    end
    disabled_dates
  end
end

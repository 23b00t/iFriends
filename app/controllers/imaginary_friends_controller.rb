class ImaginaryFriendsController < ApplicationController
  before_action :set_ifriend

  def index
    @imaginary_friends = ImaginaryFriend.all
  end

  def new
    @imaginary_friend = ImaginaryFriend.new()
  end

  def create
    @imaginary_friend = ImaginaryFriend.new(ifriend_params)
    if @imaginary_friend.save
      redirect_to imaginary_friend_path(@imaginary_friend)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @imaginary_friend = ImaginaryFriend.new(params[:id])
    if @imaginary_friend.save
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
    @booking = ImaginaryFriend.find(params[:id])
  end

  def ifriend_params
    params.require(:imaginary_friend).permit(:name, :description, :price, :special_abilities, :rented)
  end
end

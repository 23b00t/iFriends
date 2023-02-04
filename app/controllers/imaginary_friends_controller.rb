class ImaginaryFriendsController < ApplicationController
  def new
    @imaginary_friend = ImaginaryFriend.new()
  end

  def show
    @imaginary_friend = ImaginaryFriend.find(params[:id])
  end

  def create
    @imaginary_friend = ImaginaryFriend.new(ifriend_params)
    if @imaginary_friend.save
      redirect_to imaginary_friend_path(@imaginary_friend)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @imaginary_friend = ImaginaryFriend.find(params[:id])
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
    @imaginary_friend = ImaginaryFriend.find(params[:id])
    @imaginary_friend.destroy

    redirect_to imaginary_friends_path, status: :see_other
  end

  def imfriend_params
    params.require(:imaginary_friend).permit(:name, :description, :price, :special_abilities, :rented)
  end
end

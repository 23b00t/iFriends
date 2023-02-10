class ReviewsController < ApplicationController
  before_action :set_ifriend

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.imaginary_friend = @imaginary_friend
    if @review.save
      redirect_to imaginary_friend_path(@imaginary_friend)
    else
      render 'imaginary_friends/show', status: :unprocessable_entity
    end
  end

  def delete
    # raise
    @review = Review.find(params[:id])
    @review.destroy
    redirect_to imaginary_friend_path(@imaginary_friend)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_ifriend
    @imaginary_friend = ImaginaryFriend.find(params[:imaginary_friend_id])
  end
end

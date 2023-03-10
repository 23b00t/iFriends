class ReviewsController < ApplicationController
  before_action :set_ifriend
  before_action :set_review, only: %i[destroy]

  def create
    # raise
    @review = Review.new(review_params)
    @review.user = current_user
    @review.imaginary_friend = @imaginary_friend
    if @review.save
      redirect_to imaginary_friend_path(@imaginary_friend)
    else
      # It's broken maybe only raise an alert?
      # render 'imaginary_friends/show', status: :unprocessable_entity
      redirect_to imaginary_friend_path(@imaginary_friend), alert: "Please put in a comment and a rating"
    end
  end

  def destroy
    @review.destroy
    redirect_to imaginary_friend_path(@imaginary_friend)
  end

  private

  def review_params
    params.require(:review).permit(:comment, :rating)
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def set_ifriend
    @imaginary_friend = ImaginaryFriend.find(params[:imaginary_friend_id])
  end
end

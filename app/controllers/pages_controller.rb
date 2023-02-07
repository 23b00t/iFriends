class PagesController < ApplicationController
  before_action :authenticate_user!
  def home
    @imaginary_friends = ImaginaryFriend.all.select { |m| m.user_id == current_user.id }
  end
  def rent_friends
    
  end
end

class UsersController < ApplicationController
  def index
  	@users = User.all
  end

  def show
  	@orders = Order.where(user_id: current_user.id)
  end
end

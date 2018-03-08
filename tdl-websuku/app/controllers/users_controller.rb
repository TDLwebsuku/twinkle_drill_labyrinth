class UsersController < ApplicationController
	before_action :correct_user_or_admin, only: [:index, :show, :edit, :update]
  def index
  	@users = User.page(params[:page]).per(20)
  	# 論理削除済みユーザーを@deleted_usersとするあ
  	@deleted_users = User.only_deleted.page(params[:page]).per(20)
  end

  def show
  	@user = User.find_by(id: params[:id])
  	@orders = Order.where(user_id: params[:id])
  end

  def update
  	p user_params
  	respond_to do |format|
  		if @user.update_without_current_password(user_params)
  			format.html { redirect_to @user, notice: 'ユーザー情報を更新しました'}
  			format.json { render :show, status: :ok, location: @user }
  		else
  			format.html { render :edit }
  			format.json { render json: @user.errors, status: :unprocessable_entity }
  		end
  	end
  end

  private
  	def correct_user_or_admin
  		unless admin_signed_in?
  			if params[:id].nil?
  				redirect_to(items_path)
  			else	
	  			@user = User.find(params[:id])
	  			redirect_to(items_path) unless current_user = @user
	  		end
	  	end
	  end
end

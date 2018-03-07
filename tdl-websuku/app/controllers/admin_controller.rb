class AdminController < ApplicationController
	def user_destroy
		@user = User.find_by(id: params[:user_id])
		@user.destroy
		redirect_to users_index_path
	end

	def user_edit
		@user = User.find_by(id: params[:user_id])
		redirect_to edit_user_registration_path(@user, user_id: @user.id)
	end

	private
		def params_admin
			params.require(:admin).permit(:user_id)
		end

end

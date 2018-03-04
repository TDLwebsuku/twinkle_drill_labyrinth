class CartItemsController < ApplicationController
	def update
		@cart_item = CartItem.find(params[:id])
		if params[:count].to_i >0
			@cart_item.update(params_cart_item)
			redirect_to current_cart
		else
			@cart_item.destroy
			redirect_to current_cart
		end
	end

	def destroy
		@cart_item = CartItem.find_by(params[:id])
		@cart_item.destroy
		redirect_to current_cart
	end

	def params_cart_item
		params.require(:cart_item).permit(:count, :user_id)
	end

end

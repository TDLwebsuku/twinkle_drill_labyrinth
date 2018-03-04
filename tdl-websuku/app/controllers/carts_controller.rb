class CartsController < ApplicationController
	before_action :setup_cart_item!, only: [:add_item, :update_item, :delete_item]

	def show
		@cart_items = current_cart.cart_items
	end

	# 商品詳細画面から、「商品をカートに入れる」を押した時のアクション
	def add_item
		if @cart_item.blank?
			@cart_item = current_cart.cart_items.build(item_id: params[:item_id])	
		end
		@cart_item.count += params[:count].to_i
		if @cart_item.save
			redirect_to current_cart
		else
			flash[:error] = '商品数が不適切です。'
			redirect_to items_url
		end
	end

	def update_item
		@cart_item = CartItem.find_by(item_id: params[:item_id], cart_id: params[:cart_id])
		@cart_item.update(count: params[:count].to_i)
		redirect_to current_cart
	end

	def delete_item
		@cart_item = CartItem.find_by(item_id: params[:item_id], cart_id: params[:cart_id])
		@cart_item.destroy
		redirect_to current_cart
	end


	private

		def setup_cart_item!
			@cart_item = current_cart.cart_items.find_by(item_id: params[:item_id])
		end

		def params_cart_item
			params.require(:cart).permit(:cart_item_id, :count)
		end

end

class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_cart
  helper_method :current_order
  helper_method :total_price

  def current_cart
    if user_signed_in?
      if Cart.find_by(user_id: current_user.id)
        @cart = Cart.find_by(user_id: current_user.id)
      else
        @cart = Cart.create(user_id: current_user.id)
        @cart
      end
    end
  end

  def current_order
    if user_signed_in?
      if Order.find_by(user_id: current_user.id, is_purchased: 0)
        @order = Order.find_by(user_id: current_user.id, is_purchased: 0)
      else
        @order = Order.create(user_id: current_user.id)
        @order
      end
    end
  end

  def total_price
    if user_signed_in?
      @total_price = 0
      current_cart.cart_items.each do |e|
        @total_price += e.item.price * e.count
      end
      @total_price
    end
  end

  # ログイン後のリダイレクト先
  def after_sign_in_path_for(resource)
    items_path
  end

  # ログアウト後のリダイレクト先
  def after_sign_out_path_for(resource)
    items_path
  end
end

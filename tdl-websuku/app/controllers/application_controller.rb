class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception

  helper_method :current_cart
  helper_method :current_order
  helper_method :total_price

  def current_cart
    if Cart.find_by(user_id: current_user.id)
      @cart = Cart.find_by(user_id: current_user.id)
    else
      @cart = Cart.create(user_id: current_user.id)
      @cart
    end
  end

  def current_order
    if Order.find_by(user_id: current_user.id, is_purchased: 0)
      @order = Order.find_by(user_id: current_user.id, is_purchased: 0)
    else
      @order = Order.create(user_id: current_user.id)
      @order
    end
  end

  def total_price
    @total_price = 0
    current_cart.cart_items.each do |e|
      @total_price += e.item.price * e.count
    end
    @total_price
  end
end

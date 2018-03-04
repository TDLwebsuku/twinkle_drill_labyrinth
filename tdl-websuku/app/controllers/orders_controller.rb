class OrdersController < ApplicationController
  before_action :setup_order_item!, only: [:confirm_order]
  before_action :authenticate_user!, only: [:edit, :create, :destroy]

  # GET /orders
  # GET /orders.json
  def index
    @orders = Order.all
  end

  # GET /orders/1
  # GET /orders/1.json
  def show
    @order = Order.find_by(id: params[:id])
  end

  # GET /orders/new
  def new
    @order = current_order
    @order_items = OrderItem.where(order_id: current_order.id)
  end

  # GET /orders/1/edit
  def edit
  end

  # POST /orders
  # POST /orders.json
  def create
    @order = current_order
    @order.update(order_params)
    @order.total_price = total_price

    respond_to do |format|
      if @order.save
        @order.update(is_purchased: 1)
        Cart.find_by(user_id: @order.user_id).destroy
        @order.order_items.each do |order_item|
          @item = Item.find_by(id: order_item.item_id)
          @item.update(stock: @item.stock - order_item[:count])
        end
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        @order.destroy
        format.html { redirect_to items_path }
      end
    end
  end

  # DELETE /orders/1
  # DELETE /orders/1.json
  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def setup_order_item!
      @order_item = current_order.order_items.find_by(item_id: params[:item_id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def order_params
      params.require(:order).permit(:zip_code, :address, :phone_number, :last_name, :first_name, :last_name_kana, :first_name_kana)
    end


end

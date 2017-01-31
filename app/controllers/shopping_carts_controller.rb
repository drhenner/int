class ShoppingCartsController < ApplicationController

  # start the Order to go through a multi-stage checkout
  #
  def show
    @cart = Cart.where(user_id: current_user.id).last
    order_item_params = []
    order_item_params = @cart.cart_items.map do |cart_item|
      { product_id: cart_item.product_id, quantity: cart_item.quantity, shipping_method: 'USPS', is_shipped: false, shipping_state: :not_shipped }
    end

    Order.create(email: current_user.email, order_items: order_item_params)
  end

  def add_address
    @order    = Order.find(id: params[:id])
    @order.address1 = params[:address][:address1]
    @order.address2 = params[:address][:address2]
    @order.zipcode  = params[:address][:zipcode]
    @order.state    = params[:address][:state]
  end

  def add_shipping_address
    @order    = Order.find(id: params[:id])
    @order.shipping_address1 = params[:address][:address1]
    @order.shipping_address2 = params[:address][:address2]
    @order.shipping_zipcode  = params[:address][:zipcode]
    @order.shipping_state    = params[:address][:state]
  end

  def purchase
    @order.order_items.each do |order_item|
      order_item.product.purchase!(order_item.quantity)
    end
    @order.update_attributes(completed_at: Time.now)
  end
end

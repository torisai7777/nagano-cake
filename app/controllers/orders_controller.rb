class OrdersController < ApplicationController
  def show
    @order = Order.find(params[:id])
    @order_details = OrderDetail.where(order_id: @order.id)

  end


  def new
    @cart_items = current_customer.cart_items
    if @cart_items.empty?
      redirect_to customers_my_page_path
    else
    @addresses = current_customer.addresses
    @address = Address.new
    @order = Order.new
    end
  end

  def index
    @orders = Order.where(customer_id:current_customer)
  end

  def completion
  end

  def create
    @order = Order.new(order_params)
    @order.customer_id = current_customer.id
    @order.status = 0
    if @order.save
    @cart_items = current_customer.cart_items.all
    @cart_items.each do |cart|
        @order_detail = OrderDetail.new
        @order_detail.item_id = cart.item_id
        @order_detail.order_id = @order.id
        @order_detail.amount = cart.amount
        @order_detail.production_status = 0
        @order_detail.tax_included_price = cart.item.price*1.1
        @order_detail.save
        end
    current_customer.cart_items.destroy_all
    end
    redirect_to orders_completion_path
  end

  def confirm
    @cart_items = current_customer.cart_items
    if @cart_items.empty?
      redirect_to customers_my_page_path
    else
      @order = Order.new(order_params)
      if params[:order][:address_number] == "0"
         @order.postal_code = current_customer.postal_code
         @order.address = current_customer.address
         @order.name = current_customer.fullname
      elsif params[:order][:address_number] == "1"
         address = Address.find(params[:order][:address_id])
        
         @order.postal_code = address.postal_code
         @order.address = address.address
         
         @order.name = address.name
      else
      end
    @total_payment = calculate(current_customer)
    @order.total_payment = @total_payment
    @delivery_fee = 800
    @order.delivery_fee = 800
    @total_payment_plus_delivery_fee = @total_payment+ @delivery_fee
    end
  end

  private

   def order_params
     params.require(:order).permit( :address, :payment_method, :name, :postal_code,:total_payment,:delivery_fee)
   end



   # 商品合計（税込）の計算
   def calculate(user)
     total_price = 0
     user.cart_items.each do |cart_item|
       total_price += cart_item.amount * cart_item.item.price
     end
     return (total_price * 1.1).floor
   end
end

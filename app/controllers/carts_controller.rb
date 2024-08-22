class CartsController < ApplicationController
  before_action :set_cart

  def show
    @cart_items = @cart.cart_items.includes(:product)
  end

  def add_product
    product = Product.find(params[:product_id])
    @cart.add_product(product)
    redirect_to cart_path, notice: "#{product.name} was added to your cart."
  end

  def remove_product
    product_id = params[:product_id].to_i
    product = Product.find(product_id)
    @cart.remove_product(product)
    redirect_to cart_path, notice: "#{product.name} was removed from your cart."
  end

  private

  def set_cart
    @cart = current_user.cart || current_user.create_cart
  end

end

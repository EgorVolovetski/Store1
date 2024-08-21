class ProductsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_product, only: %i[show edit update destroy]

  def index
    if current_user.has_role?(:customer)
      @products = Product.includes(:category).all
    elsif current_user.has_role?(:manufacturer)
      @products = current_user.products.includes(:category)
    end
  end

  def new
    @product = current_user.products.build
    @categories = Category.all
  end

  def create
    @product = current_user.products.build(product_params)
    if @product.save
      redirect_to @product, notice: 'Product was successfully created.'
    else
      @categories = Category.all
      render :new
    end
  end

  def show; end

  def edit
    @categories = Category.all
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Product was successfully updated.'
    else
      @categories = Category.all
      render :edit
    end
  end

  def destroy
    @product.destroy
    redirect_to products_url, notice: 'Product was successfully destroyed.'
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id)
  end
end

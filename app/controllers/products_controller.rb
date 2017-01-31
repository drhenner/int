class ProductsController < ApplicationController
  def index
    @products = Product.where(active: 1).all
  end

  def types
    @products = Product.where(product_type: params[:product_type]).all
  end

  def show
    @product = Product.where(permalink: params[:permalink]).first
  end
end

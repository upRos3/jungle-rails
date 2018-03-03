class ProductsController < ApplicationController

  def index
    @products = Product.all.order(created_at: :desc)
  end

  def show
    @product = Product.find params[:id]
    @ratings = Rating.where(product_id: params[:id]).order(created_at: :desc)
    @average_rating = @ratings.average(:rating).round(1)
    puts @average_rating
  end

end

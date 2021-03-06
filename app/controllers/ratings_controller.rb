class RatingsController < ApplicationController
  before_filter :authorize

  def create
    @product = Product.find(params[:product_id])
    @rating = @product.ratings.new(rating_params)
    @rating.user_id = current_user.id

    if @rating.save
      redirect_to :back
    else
      flash[:notice] = @rating.errors.full_messages
      redirect_to :back
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @rating = @product.ratings.find(params[:id])
    @rating.destroy
    redirect_to :back, notice: 'Rating deleted!'
  end

private

  def rating_params
    params.require(:rating).permit(:description, :rating)
  end

end

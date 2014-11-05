class ReviewsController < ApplicationController

	def new
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = Review.new
	end

	def create
		@restaurant = Restaurant.find(params[:restaurant_id])
		@review = @restaurant.reviews.new(params[:review].permit(:thoughts, :rating))
		@review.user = current_user
		if @review.save
			redirect_to restaurants_path
		else
			flash[:notice] = "You've already reviewed this restaurant"
			redirect_to '/restaurants'
		end
	end

end
class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	belongs_to :users
	validates :name, length: {minimum: 3}, uniqueness: true

	def average_rating
		return 'N/A' if reviews.none?
		reviews.inject(0){|memo, review| memo + review.rating} / reviews.length
	end


end

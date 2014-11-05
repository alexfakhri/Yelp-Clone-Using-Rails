class Restaurant < ActiveRecord::Base
	has_many :reviews, dependent: :destroy
	belongs_to :users
	validates :name, length: {minimum: 3}, uniqueness: true
end

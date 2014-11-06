require 'rails_helper'

describe 'reviewing' do



	before do
		@restaurant = Restaurant.create(name: 'KFC')
		def leave_review(thoughts, rating)
			visit '/restaurants'
			click_link "Review KFC"
			fill_in "Thoughts", with: "so so"
			select '3', from: 'Rating'
			click_button 'Leave Review'
		end
	end

	it 'allows users to leave a review using a form' do
		visit '/restaurants'
		expect(current_path).to eq '/restaurants'
		Review.create(thoughts: 'So so', rating: 3, restaurant: @restaurant, user_id: 1)
		click_link "KFC"
		expect(page).to have_content('So so')
	end

	it 'should not allow a user to leave more than one review per restaurant' do
		visit '/restaurants'
		leave_review('so so', "2")
		visit '/restaurants'
		click_link "Review KFC"
		fill_in "Thoughts", with: "so so"
		select '3', from: 'Rating'
		click_button 'Leave Review'
		expect(page).to have_content("You've already reviewed this restaurant")
	end


	it 'displays an average rating for all reviews' do
		Review.create(thoughts: 'So so', rating: 3, restaurant: @restaurant, user_id: 1)
		Review.create(thoughts: 'Great', rating: 5, restaurant: @restaurant, user_id: 2)
		visit '/restaurants'
		expect(page).to have_content("Average rating: ★★★★☆")
	end



end



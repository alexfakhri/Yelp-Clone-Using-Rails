require 'rails_helper'

describe 'reviewing' do
	before do
		Restaurant.create(name: 'KFC')
		visit '/restaurants'
		click_link 'Review KFC'
		fill_in "Thoughts", with: "so so"
		select '3', from: 'Rating'
		click_button 'Leave Review'
	end

	it 'allows users to leave a review using a form' do
		expect(current_path).to eq '/restaurants'
		expect(page).to have_content('so so')
	end

	it 'should not allow a user to leave more than one review per restaurant' do
		visit '/restaurants'
		click_link 'Review KFC'
		fill_in "Thoughts", with: "so so"
		select '3', from: 'Rating'
		click_button 'Leave Review'
		expect(page).to have_content("You've already reviewed this restaurant")
	end

end

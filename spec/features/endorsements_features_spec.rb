require 'rails_helper'

describe 'endorsing reviews' do

	before do
		kfc = Restaurant.create(name: 'KFC')
		kfc.reviews.create(rating: 3, thoughts: 'It was awesome')
	end

	it 'a user can endorse a review, which updates the review endorsement count', js: true do
		visit '/restaurants'
		click_link 'KFC'
		click_link 'Endorse KFC'
		expect(page).to have_content('1 endorsement')
	end

end
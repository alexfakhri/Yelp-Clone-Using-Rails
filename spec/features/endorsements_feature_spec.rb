require 'rails_helper'

describe 'endorsing reviews' do
    before do
      tayyabs = Restaurant.create(name: 'Tayyabs')
      tayyabs.reviews.create(rating: 3, thoughts: 'It was amazing!')
    end

    it 'a user can endorse a review, which increments the endorsement count', js: true do
      visit '/restaurants'
      click_link 'Tayyabs'
      click_link 'Endorse review'
      expect(page).to have_content('1 endorsement')
    end

end

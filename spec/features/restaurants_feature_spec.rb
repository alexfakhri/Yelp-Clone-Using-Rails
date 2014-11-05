require 'rails_helper'

describe 'restaurants' do
	context 'no restaurants have been added' do
		it 'should display a prompt to add a restaurant' do
			visit '/restaurants'
			expect(page).to have_content 'No restaurants'
			expect(page).to have_link 'Add a restaurant'
		end
	end

	context 'restaurants have been added' do
		before do
			Restaurant.create(name: 'KFC')
		end

		it 'Should display restaurants' do
			visit '/restaurants'
			expect(page).to have_content('KFC')
			expect(page).not_to have_content('No restaurants yet')
		end
	end
end

describe 'creating restaurants' do

	before do
		visit '/'
		click_link('Sign up')
		fill_in('Email', with: 'test@test.com')
		fill_in('Password', with: 'test1234')
		fill_in('Password confirmation', with: 'test1234')
		click_button('Sign up')
	end

	it 'prompts the user to fill out a form, then displays the new restaurant' do
		visit '/restaurants'
		click_link 'Add a restaurant'
		fill_in 'Name', with: 'KFC'
		click_button 'Create Restaurant'
		expect(page).to have_content 'KFC'
		expect(current_path).to eq '/restaurants'
	end

	context 'an invalid restaurant' do
		
		it 'does not let you submit a name that is too short' do
			visit '/restaurants'
			click_link 'Add a restaurant'
			fill_in 'Name', with: 'kf'
			click_button 'Create Restaurant'
			expect(page).not_to have_css 'h2', text: 'kf'
			expect(page).to have_content 'error'
		end
	end

	it "should not allow users to create restaurants unless logged in" do
		visit '/restaurants'
		click_link "Sign out"
		click_link "Add a restaurant"
		expect(page).to have_content ("Log in")
	end

end

	context 'viewing restaurants' do

		before do
			@kfc = Restaurant.create(name: 'KFC')
		end

		it 'lets a user view a restaurant' do
			visit '/restaurants'
			click_link 'KFC'
			expect(page).to have_content 'KFC'
			expect(current_path).to eq "/restaurants/#{@kfc.id}"
		end

	end

context 'editing restaurants' do

	before do
		visit '/'
		click_link('Sign up')
		fill_in('Email', with: 'test@test.com')
		fill_in('Password', with: 'test1234')
		fill_in('Password confirmation', with: 'test1234')
		click_button('Sign up')
		click_link "Add a restaurant"
		fill_in 'Name', with: 'KFC'
		click_button 'Create Restaurant'	
	end

	it 'lets user edit a restaurant' do
		visit '/restaurants'
		save_and_open_page
		click_link 'Edit KFC'
		fill_in 'Name', with: 'Kentucky Fried Chicken'
		click_button 'Update Restaurant'
		expect(page).to have_content 'Kentucky Fried Chicken'
		expect(current_path).to eq '/restaurants'
	end
end


describe 'deleting restaurants' do

	before do
		visit '/'
		click_link('Sign up')
		fill_in('Email', with: 'test@test.com')
		fill_in('Password', with: 'test1234')
		fill_in('Password confirmation', with: 'test1234')
		click_button('Sign up')
		click_link "Add a restaurant"
		fill_in 'Name', with: 'KFC'
		click_button 'Create Restaurant'
	end


	it 'removes a restaurant when a user clicks a delete link' do
		visit '/restaurants'
		click_link 'Delete KFC'
		expect(page).not_to have_content 'KFC'
		expect(page).to have_content 'Restaurant deleted successfully'	
	end

end 

describe "what a user can and cant do when being logged in and out" do

	# it "should only allow users to edit and delete restaurants that they created" do
	# 	visit '/restaurants'
	# 	click_link 'Edit KFC'

	# 	fill_in 'Name', with: 'Kentucky Fried Chicken'
	# 	click_button 'Update Restaurant'
	# 	expect(page).to have_content 'Kentucky Fried Chicken'
	# 	expect(current_path).to eq '/restaurants'
	# end
end







require 'rails_helper'

context "User not signed in and on the homepage" do

	it "Should see a 'sign in' link and a 'sign up' link" do
		visit '/'
		expect(page).to have_link('Sign in')
		expect(page).to have_link('Sign up')
	end

	it "Should not see 'Sign out' link" do
		visit '/'
		expect(page).not_to have_link('Sign out')
	end

end

context "User signed in on the home page" do

	before do
		visit '/'
		click_link('Sign up')
		fill_in('Email', with: 'test@test.com')
		fill_in('Password', with: 'test1234')
		fill_in('Password confirmation', with: 'test1234')
		click_button('Sign up')
	end

	it "Should see 'sign out' link" do
		visit '/'
		expect(page).to have_link('Sign out')
	end

	it "should not see a 'sign in' link and a 'sign up' link" do
		visit '/'
		expect(page).not_to have_link('Sign in')
		expect(page).not_to have_link('Sign up')
	end
	
end
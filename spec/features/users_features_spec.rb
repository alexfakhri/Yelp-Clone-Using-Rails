require 'rails_helper'

context "User not signed in and on the homepage" do

	it "Should see a 'sign in' link and a 'sign up' link" do
		visit '/'
		expect(page).to have_link('Sign in')
		expect(page).to have_link('Sign up')
	end

end
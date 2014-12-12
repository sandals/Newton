require "rails_helper"

feature "Smoke Screen" do
	scenario "Visiting /" do
		visit root_path

		expect(page).to have_css "h1", text: "Newton"
	end
end

require "rails_helper"

feature "Creating an Article" do
	scenario "successfully" do
		visit new_article_path

		fill_in "Title", with: "foo bar baz Bat"
		fill_in "Excerpt", with: "foo bar"
		fill_in "Body", with: "swagmasterbodytest"
		click_on "Create Article"

		expect(page).to have_css "h2", text: "Foo Bar Baz Bat"
		expect(page).to have_css "p", text: "foo bar"
		expect(page).to_not have_content "swagmasterbodytest"
	end	

	scenario "unsuccessfully" do
		visit new_article_path

		fill_in "Title", with: "foo"
		click_on "Create Article"

		expect(page).to have_css ".error", text: "Excerpt can't be blank"
		expect(page).to have_css ".error", text: "Body can't be blank"
	end
end

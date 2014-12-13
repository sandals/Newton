require "rails_helper"

feature "viewing a list of articles" do
	scenario "articles should be paginated" do
		20.times { Article.create!(title: 'n', excerpt: 'foo', body: 'bar') }
		visit articles_path

		expect(page).to have_selector('h2', count: 5)
	end

	scenario "browsing the next page" do
		5.times { Article.create!(title: 'A', excerpt: 'foo', body: 'bar') }
		5.times { Article.create!(title: 'B', excerpt: 'foo', body: 'bar') }
		
		visit articles_path
		click_on "Next"

		expect(page).to have_selector('h2', text: 'B', count: 5)
	end
end

require "rails_helper"

describe ArticlesController do
	describe "POST #create" do
		context "with valid article attributes" do
			it "saves the new article in the database" do
				expect {
					post :create, article: valid_params
				}.to change(Article, :count).by(1)
			end

			it "redirects to the newly created article" do
				post :create, article: valid_params
				
				expect(response).to redirect_to articles_path
			end
		end

		context "with invalid article attributes" do
			it "does not save the article in the database" do
				expect {
					post :create, article: invalid_params
				}.to_not change(Article, :count)
			end

			it "re-renders #new" do
				post :create, article: invalid_params

				expect(response).to render_template :new
			end
		end
	end
end

def valid_params
	{ title: "foo", excerpt: "bar", body: "baz" }
end

def invalid_params
	{ title: "", excerpt: "", body: "foo" }
end

require "spec_helper"

describe UsersController do
	describe "GET #home" do
		it "responds successfully with an HTTP 200 status code" do
			get :home
			expect(response).to be_success
			expect(response.status).to eq(200)
		end

		it "renders the home template" do
			get :home
			expect(response).to render_template("home")
		end
	end

	describe "GET #chart" do
		it "responds successfully with HTTP 200 status code" do
			get :chart
			expect(response).to be_success
			expect(response.status).to eq(200)
		end

		it "renders the chart template" do
			get :chart
			expect(response).to render_template("chart")
		end
	end
end
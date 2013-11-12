require "spec_helper"

describe "routes to the users controller" do |variable|
	it "routes a named route" do
		expect(:get => root_path).
		to route_to(:controller => "users", :action => "home")
	end

	it "routes a named route" do
		expect(:get => chart_path).
		to route_to(:controller => "users", :action => "chart")
	end

	it "routes a named route" do
		expect(:post => receiver_path).
		to route_to(:controller => "users", :action => "receiver")
	end

	it "routes a named route" do
		expect(:get => transmit_path).
		to route_to(:controller => "users", :action => "transmit")
	end
end
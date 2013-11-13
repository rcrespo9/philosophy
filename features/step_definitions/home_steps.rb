Given(/^I visit '(\w+)'$/) do |x|
	if x != "home"
		visit '/'+x.to_s
	else
		visit "/"
	end
end

Given(/^I click the right arrow image$/) do
	find('#rightArrow').click
end

Given(/^the screen is shifted to the next slide$/) do
  	'background-position: -204px 0px;'
end

Given(/^I visit the homepage$/) do
	visit '/'
end

Given(/^I click the right arrow image$/) do
	find('#rightArrow').click
end

Given(/^the screen is shifted to the next slide$/) do
  	'background-position: -204px 0px;'
end

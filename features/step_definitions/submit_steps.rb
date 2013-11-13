Given(/^I visit the homepage$/) do
	visit '/'
end

Given(/^I choose an age group$/) do
	select('option', :from => '#age')
end

Given(/^I choose a gender$/) do
	find('#rightArrow').click
end

Given(/^I select a value$/) do
	find('#rightArrow').click
end

Given(/^I should be redirected to the chart page$/) do
	visit './chart'
end
Feature: Submit form data off home page
	I want to submit data from the home page and then view it. I should be able to click a button to submit my data, then be redirected to a different URL.

	Scenario: Submit my data from the homepage via click button and then redirect to a different URL.
		Given I visit the homepage

		And I choose an age group

		And I choose a gender

		And I select a value

		When I press submit

		Then I should be redirected to the charts URL
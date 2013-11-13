Feature: Parallax home page
	I want to land on a home page which uses parallax. I should be able to click a button to view a new slide without a url change.

	Scenario: Visit parallax home page and slide to selection page.
		Given I visit the homepage

		And I click the right arrow image

		Then the screen is shifted to the next slide


	Scenario: Submit my data from the homepage via click button and then redirect to a different URL.
		Given I visit the homepage

		And I choose an age group

		And I choose a gender

		And I select a value

		When I press submit

		Then I should be redirected to the charts URL
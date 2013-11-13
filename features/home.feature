Feature: Parallax home page
	I want to land on a home page which uses parallax. I should be able to click a button to view a new slide without a url change.

	Scenario: Visit parallax home page and slide to selection page.
		Given I visit 'home'

		And I click the right arrow image

		Then the screen is shifted to the next slide
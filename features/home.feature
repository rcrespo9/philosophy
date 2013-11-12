Feature: Parallax home page
	I want to land on a home page which uses parallax. I should be able to click a button to view a new slide without a url change.

	Scenario: Visit parallax home page
		Given I visit the homepage
		And I click the next button

		When I click next
		Then I should see new content with the same URL.
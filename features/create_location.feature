Feature: Create a location
	In order track items
	Members
	Should be able to create locations

	Scenario: Create location
		Given I am logged in as a member
		When I create a location
		Then that location should get added to the list
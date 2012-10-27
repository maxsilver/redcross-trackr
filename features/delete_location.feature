Feature: Delete a location
	In order cut down on clutter
	Members
	Should be able to delete locations

	Scenario: Delete location
		Given I am logged in as a member
		When I delete a location
		Then that location should get set to inactive, but not actually deleted
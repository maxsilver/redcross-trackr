Feature: Delete a location
	In order cut down on clutter
	Members
	Should be able to delete locations

	Scenario: Delete location
		Given I am logged in as a member
		When I delete a location
		Then that location should get set to inactive, but not actually deleted

  Scenario: Delete location with items
		Given I am logged in as a member
    And I have a location that has items attached to it
		When I try to delete that location
    Then I should get an error
    And that location should not be deleted

Feature: Give an item
  In order for chapters to get the supplies they need when the need arises
  Chapters
  Should be able to give items to other chapters (or outside, non-Red Cross entities)

  Scenario: I can give all of an item
    Given I am logged in as a member
    And a location "My House" exists
    And a location "The Park" exists
    And an item definition "Cots" exists
    And "My House" has 100 "Blue Cots" (which are "Cots")
    When I am on the "My House" location page
    And I follow "Blue Cots"
    And I follow "Give"
    And I select "The Park" from "Location"
    And I press "Give Item"
    Then "The Park" should have 100 "Blue Cots"
    And "My House" should have 0 "Blue Cots"

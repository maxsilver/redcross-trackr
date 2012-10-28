Feature: Lend an item
  In order for chapters to get the supplies they need when the need arises
  Chapters
  Should be able to lend items to other chapters

  Background:
    Given I am logged in as a member
    And a location "My House" exists
    And a location "The Park" exists
    And an item definition "Cots" exists
    And "My House" has 100 "Blue Cots" (which are "Cots")
    When I am on the "My House" location page
    And I follow "Blue Cots"
    And I follow "Lend"
    And I select "The Park" from "Location"

  Scenario: I can give all of an item
    When I press "Lend Items"
    Then "The Park" should have 100 "Blue Cots"
    And "My House" should have 0 "Blue Cots"

  Scenario: I can give some of an item
    When I put in a quantity of 20
    And I press "Lend Items"
    Then "The Park" should have 20 "Blue Cots"
    And "My House" should have 80 "Blue Cots"

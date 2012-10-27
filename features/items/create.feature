Feature: Create an item
  In order track items
  Members
  Should be able to create an item

  Scenario: Create location
    Given I am logged in as a member
    Given there exists an item definition "Cot":
      | Label | Cot |
      | Kind  | 1   |

    Given there exists a location "Purple Place":

    When I am on the "Purple Place" location page
    And I add the following item to the location:
      | Kind           | Cot       |
      | Label          | 6 ft. Cot |
      | Quantity       | 12        |

    Then I should be on the "Purple Place" location page
    And I should see the following item:
      | Label    | 6 ft. Cot  |
      | Quantity  | 12        |
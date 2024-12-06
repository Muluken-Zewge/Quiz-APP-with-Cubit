Feature: Catagory, difficulty and question number Selection

  Scenario: Catagory Selection screen is presented
    Given the app is running
    Then i see the Catagory Selection page

  Scenario: User selects a Catagory
    Given the app is running
    When i tap a Catagory
    Then I am navigated to the difficulty selection screen

  Scenario: difficulty Selection screen is presented
    Given i am on the difficulty selection screen
    Then i see {'Choose a difficulty'} text
    And i see the following difficulty levels:
      | {'Easy'}   |
      | {'Medium'} |
      | {'Hard'}   |

  Scenario: User selects a difficulty
    Given i am on the difficulty selection screen
    When i tap a difficulty
    Then I am navigated to the question number selection screen

  Scenario: question number Selection screen is presented
    Given i am on question number Selection screen
    Then i see {'Choose number of questions'} text
    And i see {1} number
    And i see {'Start Quiz'} text

  Scenario: User increment and decrement the counter
    Given i am on question number Selection screen
    When i tap the {'+'} icon
    Then i see {2} number
    When i tap the {'-'} icon
    Then i see {1} number

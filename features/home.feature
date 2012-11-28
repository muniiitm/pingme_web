Feature: 
  
  Scenario: Login - Valid details
  
    Given that I am on the login page
    When i fill the username and password
    And i press login button
    Then i should be render to dashboard page
    
  
  Scenario: Login - Invalid details
  
    Given that I am on the login page
    When i fill the invalid username and password
    And i press login button
    Then i should see the error message
  
  Scenario: Logout 
    Given I am logged in as user
    And when i click on logout link
    Then i should be logged out and redirected to home page.
  
  Scenario: Show Home - Testing
    Given i am on the home page
    Then i should all the details
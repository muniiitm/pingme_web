Feature: 
  
  Scenario: Show Home
    Given i am on the home page
    Then i should all the details
 
  Scenario: Show Home - Login
    Given i am on the home page after logged
    Then i should see the  option to update the location

    
  Scenario: Login - Valid details
  
  Given i am on the login page
  Then i should see the login screen
  When i fill the username and password
  And i press login button
  Then i should be render to dashboard page
  
  
  Scenario: Login - Invalid details
  
  Given i am on the login page
  Then i should see the login screen
  When i fill the invalid username and password
  And i press login button
  Then i should see the error message
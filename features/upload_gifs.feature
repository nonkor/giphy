Feature: Upload new gif
  In order to store and share my own gifs
  As I customer
  I should be able to create an account
  And upload gifs under this account
  Making them public or private

  Scenario: Visitor logs in
    Given I am on giphy site
    When I navigate to the login page
    And I login as "TestAcc7819"
    Then I should be logged in

  Scenario: Unauthenticated visitor cannot upload a gif
    Given I am unauthenticated visitor
    When I navigate to the upload page
    And I try to upload a gif
    Then I should be informed about a need to authenticate

  Scenario: Authenticated user uploads a gif from local source
    Given I am logged in as "TestAcc7819"
    And I am on the upload page
    When I upload a gif from local source
    Then the gif should be uploaded
    And desired tag should be specified

  Scenario: Authenticatedcated user uploads a gif by URL
    Given I am logged in as "TestAcc7819"
    And I am on the upload page
    When I upload a gif by url
    Then the gif should be uploaded
    And desired tag should be specified

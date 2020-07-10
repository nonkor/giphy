Feature: Browse available gifs
  In order to have a better way to express themself chatting
  Or just have fun observing all available options from giphy
  As a customer
  I should be able to search gif file by a tag or browse gifs grouped by categories and upload dates

  Background:
    Given I am on giphy site

  Scenario: Autocompletion for search keyword
    When I specify "show" as keyword
    Then I should see autocomplete options for my search request
    And I should see suggested channels related to my search request

  Scenario: Search gif by a tag
    When I search by "show"
    Then I should see related gifs
    And I should see related channels
    And the data should be sorted by "relevant" creteria

  Scenario: Search gif under specific channel
    When I search by "@snl show"
    Then only "Saturday Night Live" gifs should be listed
    And "show" should be specified as keyword

  Scenario: No relevant gifs
    When I search by "nowayIcanfindsomething"
    Then I should not see any gifs
    And I should see message - no gifs found for "nowayIcanfindsomething"

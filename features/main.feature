Feature: Open the home page and see a list of books
  In order to allow visitors to the site
  As an unregistered user
  I want to see the homepage which lists recent favorited books
  And have a valid link to buy on Amazon
  And try to add a book to my favorites, then be prompted to log in

  Background:
    Given I am not logged in
    Given I am a user named "Joe Smith" with an email "joe@example.com"
    And I have added the following books as favorites:
      | title       | author       | asin  | image_url   | amazon_url          |
      | Star Wars   | George Lucas | 12345 | hansolo.jpg | "http://amazon.com" |
      | Hello Kitty | Sanrio       | 23456 | kitty.jpg   | "http://amazon.com" |
      | Ulysses     | James Joyce  | 34567 | bloom.jpg   | "http://amazon.com" |

    And I go to the homepage

  Scenario: Home page should load when not logged in
    Then I should see "CONSOOM!"
    And I should see "Sign in"

  Scenario: Recent favorites should be displayed when not logged in
    Then I should see "Star Wars"
    Then I should see "George Lucas"
    Then I should see "Hello Kitty"
    Then I should see "Sanrio"
    Then I should see "Ulysses"
    Then I should see "James Joyce"

  Scenario: I should see a valid Amazon button
    Then I should see a Buy Now button from Amazon
    And when I click it, it should take me to an Amazon.com link

Feature: Sign in
  In order to get access to protected sections of the site
  A user
  Should be able to sign in

    Scenario: User is not signed up
      Given I am not logged in
      And no user exists with an email of "user@test.com"
      When I go to the sign in page
      And I sign in as "user@test.com"
      Then I should see "Sign in"

    Scenario: User enters wrong password
      Given I am not logged in
      And I am a user named "foo" with an email "user@test.com"
      When I go to the sign in page
      And I sign in as "user@test.com/wrongpassword"
      Then I should see "Sign in"

    Scenario: User signs in successfully with email
      Given I am not logged in
      And I am a user named "foo" with an email "user@test.com"
      When I go to the sign in page
      And I sign in as "user@test.com"
      Then I should see "Signed in successfully."
      And I should be signed in
      When I return next time
      Then I should be already signed in

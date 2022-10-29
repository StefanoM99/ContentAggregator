@admin
Feature: Admin deletes a reported post

    Background:

    Scenario: Admin deletes 1/1 reported posts
        Given I signed in as admin
        And there is 1 reported post by "Autore DelPost" with title "Titolo" and summary "Sommario"
        And I am on profile page
        Then I should see "Autore DelPost"
        And I should see "Titolo"
        And I should see "Sommario"
        And I should see "Elimina"
        When I press "Elimina"
        Then I should be on profile page
        And  I should not see "Autore DelPost"
        And I should not see "Titolo"
        And I should not see "Sommario"

    Scenario: Admin deletes 1/2 reported posts
        Given I signed in as admin
        And there are 2 reported post by "Autore DelPost"
        And I am on profile page
        Then I should see 2 "Autore DelPost"
        And I should see 2 "Elimina"
        When I press first "Elimina"
        Then I should be on profile page
        And I should see 1 "Autore DelPost"
        And I should see 1 "Elimina"
@admin
Feature: Admin deletes a reported post

    Background:
        Given I signed in as admin

    Scenario: Admin deletes 1 in 1 reported posts
        Given there is 1 reported post by "Autore DelPost" with title "Titolo" and summary "Sommario"
        And I am on reported-posts page
        Then I should see "Autore DelPost"
        And I should see "Titolo"
        And I should see "Sommario"
        And I should see "Elimina"
        When I press "Elimina"
        Then I should be on reported-posts page
        And  I should not see "Autore DelPost"
        And I should not see "Titolo"
        And I should not see "Sommario"

    Scenario: Admin deletes 1 in 3 reported posts by Autore DelPost
        Given there are 3 reported posts by "Autore DelPost"
        And I am on reported-posts page
        Then I should see 3 "Autore DelPost"
        And I should see "Titolo 1 post"
        And I should see "Titolo 2 post"
        And I should see "Titolo 3 post"
        And I should see 3 "Elimina"
        When I press first "Elimina"
        Then I should be on reported-posts page
        And I should see 2 "Autore DelPost"
        And I should not see "Titolo 1 post"
        And I should see "Titolo 2 post"
        And I should see "Titolo 3 post"
        And I should see 2 "Elimina"

    Scenario: Admin deletes 1 in 10 reported posts by Autore DelPost
        Given there are 10 reported posts by "Autore DelPost"
        And I am on reported-posts page
        Then I should see 10 "Autore DelPost"
        And I should see "Titolo 1 post"
        And I should see 10 "Elimina"
        When I press first "Elimina"
        Then I should be on reported-posts page
        And I should see 9 "Autore DelPost"
        And I should not see "Titolo 1 post"
        And I should see 9 "Elimina"

    # @prova
    # Scenario: Admin deletes 1 in 1 reported posts
    #     Given there is 1 reported post by "Autore DelPost" with title "Titolo" and summary "Sommario"
    #     And there is 1 reported post by "Autore DelPost" with title "Titolo" and summary "Sommario"
    #     And I am on reported-posts page
    #     Then I should see "Autore DelPost"
    #     And I should see "Titolo"
    #     And I should see "Sommario"
    #     And I should see "Elimina"
    #     When I press "Elimina"
    #     Then I should be on reported-posts page
    #     And  I should not see "Autore DelPost"
    #     And I should not see "Titolo"
    #     And I should not see "Sommario"

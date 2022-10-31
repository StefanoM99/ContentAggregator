@admin @article
Feature: Admin deletes a reported article

    Background:
        Given I signed in as admin

    @single
    Scenario: Admin deletes 1 in 1 reported article
        Given there is 1 reported article with title "Titolo" and description "Descrizione"
        And I am on reported-articles page
        And show me the page
        Then I should see "Titolo"
        Then I should see "Descrizione"
        And I should see "Elimina"
        When I press "Elimina"
        Then I should be on reported-articles page
        And  I should not see "Titolo"
        And  I should not see "Descrizione"
        And I should not see "Elimina"

    @many
    Scenario: Admin deletes 1 in 9 reported articles
        Given there is 1 reported article with title "Titolo" and description "Descrizione" and 9 other
        And I am on reported-articles page
        Then I should see 1 "Titolo"
        Then I should see 1 "Descrizione"
        And I should see 10 "Elimina"
        When I press first "Elimina"
        Then I should be on reported-articles page
        And I should not see "Titolo"
        And I should not see "Descrizione"
        And I should see 9 "Elimina"

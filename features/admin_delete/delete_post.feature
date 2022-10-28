Feature: Admin can delete a reported post 

Background:
    Given a user logged as admin

    Scenario: Delete a reported post from profile page
        Given i am on profile page
        And there is at least a reported post
        When i press "Elimina"
        Then i should remove the post from db
        And i should add the post in the blacklist
        And i should go on profile page


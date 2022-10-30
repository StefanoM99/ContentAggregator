Feature: Admin can delete a reported post 

Background: There is at least a reported post by logged user
        Given I am registered
        And I am logged in


    Scenario: Delete a reported post from profile page
        Given I am on the ContentAggregator home page
        When I fill in "E-Mail" with "admin@admin.com"
        And I fill in "Password" with "password"
        And I press "Accedi"
        Then I should be on Admin profile page
        When I press "ELIMINA"
        Then I should be on ContentAggregator profile page


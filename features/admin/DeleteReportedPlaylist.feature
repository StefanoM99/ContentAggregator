@admin @playlist
Feature: Admin deletes a reported playlist

    Background:
        Given I signed in as admin

    @single
    Scenario: Admin deletes 1 in 1 reported playlist
        Given there is 1 reported playlist with the url "https://open.spotify.com/playlist/esempio"
        And I am on reported-playlists page
        Then I should see "https://open.spotify.com/playlist/esempio"
        And I should see "Elimina"
        When I press "Elimina"
        Then I should be on reported-playlists page
        And  I should not see "https://open.spotify.com/playlist/esempio"
        And I should not see "Elimina"

    @many
    Scenario: Admin deletes 1 in 9 reported playlist
        Given there is 1 reported playlist with the url "https://open.spotify.com/playlist/esempio" and 9 other
        And I am on reported-playlists page
        Then I should see 1 "https://open.spotify.com/playlist/esempio"
        And I should see 10 "Elimina"
        When I press first "Elimina"
        Then I should be on reported-playlists page
        And I should not see "https://open.spotify.com/playlist/esempio"
        And I should see 9 "Elimina"

@user
Feature: User creates a post

    Background:
        Given I signed in as "prova@gmail.com"
        And I am on new-post page

    @no_title
    Scenario: User tries to create a blank post
        When I press "Create Post"
        Then I should be on new-post page
        And I should see "Post non valido. Deve essere presente un titolo."

    @no_title
    Scenario: User tries to create a post w/out Titolo (Sommario)
        When I fill in "Sommario" with "Mio riepilogo"
        And I press "Create Post"
        Then I should be on new-post page
        And I should see "Post non valido. Deve essere presente un titolo."

    @no_title
    Scenario: User tries to create a post w/out Titolo (Image)
        When I upload an image
        And I press "Create Post"
        Then I should be on new-post page
        And I should see "Post non valido. Deve essere presente un titolo."

    @no_title
    Scenario: User tries to create a post w/out Titolo (Sommario+Image)
        When I fill in "Sommario" with "Mio riepilogo"
        And I upload an image
        And I press "Create Post"
        Then I should be on new-post page
        And I should see "Post non valido. Deve essere presente un titolo."

    @title
    Scenario: User creates a post (Titolo)
        When I fill in "Titolo" with "Mio titolo"
        And I press "Create Post"
        Then I should be on that post's page
        And I should see "Test Prova"
        And I should see "Mio titolo"

    @title @summary
    Scenario: User creates a post (Titolo+Sommario)
        When I fill in "Titolo" with "Mio titolo"
        And I fill in "Sommario" with "Mio riepilogo"
        And I press "Create Post"
        Then I should be on that post's page
        And I should see "Test Prova"
        And I should see "Mio titolo"
        And I should see "Mio riepilogo"

    @title @upload
    Scenario: User creates a post (Titolo+Image)
        When I fill in "Titolo" with "Mio titolo"
        And I upload an image
        And I press "Create Post"
        Then I should be on that post's page
        And I should see the image I uploaded
        And I should see "Test Prova"
        And I should see "Mio titolo"

    @title @summary @upload
    Scenario: User creates a post (Titolo+Sommario+Image)
        When I fill in "Titolo" with "Mio titolo"
        And I fill in "Sommario" with "Mio riepilogo"
        And I upload an image
        And I press "Create Post"
        Then I should be on that post's page
        And I should see the image I uploaded
        And I should see "Test Prova"
        And I should see "Mio titolo"
        And I should see "Mio riepilogo"

    @title @upload
    Scenario: User tries to create a post uploading something else (Titolo+File)
        When I fill in "Titolo" with "Mio titolo"
        And I upload a text file
        And I press "Create Post"
        Then I should be on new-post page
        And I should see "Post non valido. File supportati: jpeg, png"

    @title @summary @upload
    Scenario: User tries to create a post uploading something else (Titolo+Sommario+File)
        When I fill in "Titolo" with "Mio titolo"
        And I fill in "Sommario" with "Mio riepilogo"
        And I upload a text file
        And I press "Create Post"
        Then I should be on new-post page
        And I should see "Post non valido. File supportati: jpeg, png"

    @title @summary @link
    Scenario: User creates a post with a safe link
        When I fill in "Titolo" with "Mio titolo"
        And I fill in "Sommario" with "Innocuo https://www.google.it"
        And I press "Create Post"
        Then I should be on that post's page
        And I should see "Test Prova"
        And I should see "Mio titolo"
        And I should see "Innocuo https://www.google.it"

    @title @summary @link
    Scenario: User tries to create a post with a malware link
        When I fill in "Titolo" with "Mio titolo"
        And I fill in "Sommario" with "Malevolo https://testsafebrowsing.appspot.com/s/malware.html"
        And I press "Create Post"
        Then I should be on new-post page
        And I should see "Il post contiene un link pericoloso."

    @title @summary @link
    Scenario: User tries to create a post with a safe link and a malware link
        When I fill in "Titolo" with "Mio titolo"
        And I fill in "Sommario" with "Innocuo https://www.google.it Malevolo https://testsafebrowsing.appspot.com/s/malware.html"
        And I press "Create Post"
        Then I should be on new-post page
        And I should see "Il post contiene un link pericoloso."

    @title @summary @link @upload
    Scenario: User tries to create a post with a malware link and uploading a file
        When I fill in "Titolo" with "Mio titolo"
        And I fill in "Sommario" with "Malevolo https://testsafebrowsing.appspot.com/s/malware.html"
        And I upload a text file
        And I press "Create Post"
        Then I should be on new-post page
        And I should see "Post non valido. File supportati: jpeg, png"

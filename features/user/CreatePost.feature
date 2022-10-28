Feature: User creates a post

    Background:
        Given I signed in as "prova@gmail.com"
        And I am on new-post page

    Scenario: User creates a post (Title)
        When I fill in "Title" with "Mio titolo"
        And I press "Create Post"
        Then I should be on that post page
        And I should see "Test Prova"
        And I should see "Mio titolo"

    Scenario: User creates a post (Title+Summary)
        When I fill in "Title" with "Mio titolo"
        And I fill in "Summary" with "Mio riepilogo"
        And I press "Create Post"
        Then I should be on that post page
        And I should see "Test Prova"
        And I should see "Mio titolo"
        And I should see "Mio riepilogo"

    Scenario: User creates a post (Title+Summary+Image)
        When I fill in "Title" with "Mio titolo"
        And I fill in "Summary" with "Mio riepilogo"
        And I upload an image
        And I press "Create Post"
        Then I should be on that post page
        And I should see the image I uploaded
        And I should see "Test Prova"
        And I should see "Mio titolo"
        And I should see "Mio riepilogo"

    Scenario: User creates a post (Title+Summary+Video)
        When I fill in "Title" with "Mio titolo"
        And I fill in "Summary" with "Mio riepilogo"
        And I upload a video
        And I press "Create Post"
        Then I should be on that post page
        And I should see the video I uploaded
        And I should see "Test Prova"
        And I should see "Mio titolo"
        And I should see "Mio riepilogo"

    Scenario: User tries to create a post with a malware link
        When I fill in "Title" with "Mio titolo"
        And I fill in "Summary" with "Malevolo: https://testsafebrowsing.appspot.com/s/malware.html"
        And I press "Create Post"
        Then I should be on new-post page
        And I should see "Il post contiene un link pericoloso."

    Scenario: User tries to create a post with a safe link and a malware link
        When I fill in "Title" with "Mio titolo"
        And I fill in "Summary" with "Innocuo: https://www.google.it Malevolo: https://testsafebrowsing.appspot.com/s/malware.html"
        And I press "Create Post"
        Then I should be on new-post page
        And I should see "Il post contiene un link pericoloso."

    Scenario: User tries to create a post w/out Title
        When I press "Create Post"
        Then I should be on posts page
        And I should see "Title can't be blank"

    # Scenario: User signs up and creates a post
    #     Given I am on home page
    #     When I follow "Non hai ancora creato un account? Registrati ora!"
    #     Then I should be on sign-up page
    #     When I fill in "Nome" with "Prova"
    #     And I fill in "Cognome" with "Test"
    #     And I fill in "E-Mail" with "test@gmail.com"
    #     And I fill in "Password (Minimo 6 caratteri)" with "123456"
    #     And I fill in "Conferma Password" with "123456"
    #     And I press "Registrati"
    #     Then I should be on feed page
    #     And I should be logged in as "test@gmail.com"
    #     When I follow "Nuovo post"
    #     Then I should be on new-post page
    #     When I fill in "Title" with "Mio titolo"
    #     And I fill in "Summary" with "Mio riepilogo"
    #     And I press "Create Post"
    #     Then I should be on that post page
    #     And I should see "Autore: Prova Test"
    #     And I should see "Mio titolo"
    #     And I should see "Mio riepilogo"

    # Scenario: User signs in and creates a post
    #     Given I am on home page
    #     And I signed up as "prova@gmail.com"
    #     When I fill in "E-Mail" with "prova@gmail.com"
    #     And I fill in "Password" with "password"
    #     And I press "Accedi"
    #     Then I should be on feed page
    #     And I should be logged in as "prova@gmail.com"
    #     When I follow "Nuovo post"
    #     Then I should be on new-post page
    #     When I fill in "Title" with "Mio titolo"
    #     And I fill in "Summary" with "Mio riepilogo"
    #     And I press "Create Post"
    #     Then I should be on that post page
    #     And I should see "Test Prova"
    #     And I should see "Mio titolo"
    #     And I should see "Mio riepilogo"
Feature: Are hard coded To-Dos displayed?

  Scenario: To-Dos to be listed : 
    Given the user visits the To-Do Home Page
    When the page is loaded
    Then user should be presented the following To-Dos "Finish English Homework, Take The Trash Out, Wash Dishes"
# *** indicates that it is a Module

*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Test Teardown    Close Browser

#Storing variables in this module makes the variable global
*** Variables ***
${Error_Message_Login}    css:.alert-danger



*** Test Cases ***
Validate Unsuccessful Login

    open the browser with the Mortgage payment url
    Fill the login form
    wait until it checks and display error message
    verify if error message is correct


*** Keywords ***
open the browser with the Mortgage payment url
    Create Webdriver     Chrome
    Go To    https://rahulshettyacademy.com/loginpagePractise/

Fill the login form
    Input Text        id:username    rahulshettyacademy
    Input Password    id:password    12345678
    Click Button      signInBtn


wait until it checks and display error message
    Wait Until Element Is Visible    ${Error_Message_Login}


verify if error message is correct
   ${result}=     Get Text    ${Error_Message_Login}
   Should Be Equal As Strings     ${result}    Incorrect username/password.

   #line code 43 is simplified of line code 39 and 40
   Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.

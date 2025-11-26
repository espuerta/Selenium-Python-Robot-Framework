# *** indicates that it is a Module

*** Settings ***
Documentation    To validate the Login form
Library    SeleniumLibrary
Library    Collections
Test Setup      open the browser with the Mortgage payment url
Test Teardown    Close Browser
Resource    resource.robot

#Storing variables in this module makes the variable global
*** Variables ***
${Error_Message_Login}      css:.alert-danger
${Shop_page_load}           css:.nav-link



*** Test Cases ***
#Validate Unsuccessful Login
#
#    Fill the login Form      ${user_name}     ${invalid_password}
#    wait until Element is located in the page      ${Error_Message_Login}
#    verify if error message is correct

Validate Cards display in the Shopping Page
    Fill the login form     ${user_name}     ${valid_password}
    wait until Element is located in the page       ${Shop_page_load}
    Verify Card titles in the shop page
    Select the Card     BlackBerry





*** Keywords ***

Fill the login Form
    [arguments]     ${user_name}     ${password}
    Input Text        id:username    ${user_name}
    Input Password    id:password    ${password}
    Click Button      signInBtn

wait until Element is located in the page
    [arguments]     ${element}
    Wait Until Element Is Visible    ${element}


verify if error message is correct
   ${result}=     Get Text    ${Error_Message_Login}
   Should Be Equal As Strings     ${result}    Incorrect username/password.

   #line code 43 is simplified of line code 39 and 40
   Element Text Should Be    ${Error_Message_Login}    Incorrect username/password.


#Code from line 59 to 68 is all about how to create list, how to append to the list, how to create a list with different items, and also iterated through that FOR LOOP and grabbed the text and making sure that the lists are equal or validated-
#also it covers the validation/comparing two different lists, like expected result lists and actual result of lists
#Use the code below for reference if you want to get the labels then have it validated.
Verify Card titles in the shop page
   @{expectedList} =  Create List     iphone X        Samsung Note 8      Nokia Edge      Blackberry
   ${elements} =  Get WebElements    css:.card-title
   @{actuallist} =  Create List
   FOR    ${element}    IN    @{elements}
       Log    ${element.text}
       Append To List       ${actuallist}       ${element.text}

   END
   Lists Should Be Equal    ${expectedList}    ${actuallist}
#   Note: If you create a list for the first time, make sure you put @, but if, any kind of variables should start with $



Select the Card
    [arguments]     ${cardName}
    ${elements} =  Get WebElements    css:.card-title
    Click Button    xpath:(//*[@class='card-footer'])[4]/button



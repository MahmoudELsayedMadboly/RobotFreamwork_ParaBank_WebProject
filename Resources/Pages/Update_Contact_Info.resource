*** Settings ***
library     SeleniumLibrary
Resource    ../Common/CommonKeyword.resource



*** Variables ***
#locators
${UPDATE_CONTACT_INFO_LINK}    xpath=//a[text()='Update Contact Info'] 
${First_Name_FIELD}          id=customer.firstName
${FIRST_NAME_ERROR_MESSAGE}    id=firstName-error
${UPDATE_PROFILE_BUTTON}    xpath=//input[@value='Update Profile']
${PROFILE_UPDATED_HEADER}    xpath=//h1[@class='title' and normalize-space(text())='Profile Updated']    



*** Keywords ***

Update First Name Field
    [Arguments]    ${newFirstName}
    [Documentation]    Updates the First Name field on the Update Contact Info page
    Safe Input Text    ${First_Name_FIELD}    ${newFirstName}


Clear First Name Field
    [Documentation]    Clears the First Name field on the Update Contact Info page
    Clear Element Text    ${First_Name_FIELD}



Hit Update Profile Button
    [Documentation]    Clicks the Update Profile button on the Update Contact Info page
    Safe Click    ${UPDATE_PROFILE_BUTTON}



Verify Profile Update Success
    [Documentation]    Verifies that the Profile Updated header is displayed after a successful update
    [Arguments]    
    Element Should Be Visible    ${PROFILE_UPDATED_HEADER}



Verify Validation Message Is Displayed
    [Documentation]    Verifies that the validation error message for the updated field is displayed
    Verify Element Is Visible    ${FIRST_NAME_ERROR_MESSAGE}
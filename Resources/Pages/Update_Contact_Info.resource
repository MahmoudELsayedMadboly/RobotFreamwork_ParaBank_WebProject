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

    Wait Until Field Is Populated    
    ...    ${First_Name_FIELD}             
    ...    ${StandardWait}    
    ...    ${PingTime}

    Safe Input Text    ${First_Name_FIELD}    ${newFirstName}


Clear First Name Field
    [Documentation]    Clears the First Name field on the Update Contact Info page
    Clear Element Text    ${First_Name_FIELD}
    


Field Should Have A Value
    [Arguments]    ${locator}
    ${value}=    Get Value    ${locator}
    Should Not Be Empty    ${value}



Wait Until Field Is Populated
    [Arguments]    
    ...    ${locator}        
    ...    ${timeout}    
    ...    ${PingTime}

       Wait Until Keyword Succeeds
    ...    ${timeout}
    ...    ${PingTime}
    ...    Field Should Have A Value
    ...    ${locator}




Hit Update Profile Button
    [Documentation]    Clicks the Update Profile button on the Update Contact Info page
    Safe Click    ${UPDATE_PROFILE_BUTTON}
    #wait Until Page Contains Element    ${PROFILE_UPDATED_HEADER}    ${StandardWait}



Verify Profile Update Success
    [Documentation]    Verifies that the Profile Updated header is displayed after a successful update
     
    verify Element Is Visible    ${PROFILE_UPDATED_HEADER}



Verify Validation Message Is Displayed
    [Documentation]    Verifies that the validation error message for the updated field is displayed
    Verify Element Is Visible    ${FIRST_NAME_ERROR_MESSAGE}



#this keyword need to be refactored
Verify The New First Name Is Displayed
    [Documentation]    Verifies that the new first name is displayed on the Update Contact Info page after a successful update
    [Arguments]    ${New_FirstName}


    Wait Until Field Is Populated    
   ...    ${First_Name_FIELD}             
    ...    ${StandardWait}    
    ...    ${PingTime}   
    
    Should Not Be Empty    ${First_Name_FIELD}
    ${UpdatedFirstName}=   get Value    ${First_Name_FIELD}
    
    Should Be Equal    ${UpdatedFirstName}    ${New_FirstName}
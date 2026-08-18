*** Settings ***
library     SeleniumLibrary
Resource    ../Common/CommonKeyword.resource



*** Variables ***
#locators
${REGISTER_PAGE_HEADER}    xpath=//h1[text()='Signing up is easy!']   
${FIRST_NAME_FIELD}          id=customer.firstName
${LAST_NAME_FIELD}           id=customer.lastName
${ADDRESS_FIELD}             id=customer.address.street
${CITY_FIELD}                id=customer.address.city
${STATE_FIELD}               id=customer.address.state
${ZIPCODE_FIELD}             id=customer.address.zipCode
${PHONE_FIELD}                id=customer.phoneNumber
${SSN_FIELD}                  id=customer.ssn
${NEW_USERNAME_FIELD}         id=customer.username
${NEW_PASSWORD_FIELD}         id=customer.password
${CONFIRM_PASSWORD_FIELD}     id=repeatedPassword
${REGISTER_BUTTON}            xpath=//input[@value='Register']
${REGISTER_SUCCESS_MESSAGE}    xpath=//p[text()='Your account was created successfully. You are now logged in.']



*** Keywords ***
Set Register User Data
    [Arguments]    
    ...    ${firstName}    
    ...    ${lastName}    
    ...    ${address}    
    ...    ${city}    
    ...    ${state}    
    ...    ${zipCode}    
    ...    ${phoneNumber}    
    ...    ${ssn}    
    ...    ${username}    
    ...    ${password}


    Input Text    ${FIRST_NAME_FIELD}          ${firstName}
    Input Text    ${LAST_NAME_FIELD}           ${lastName}
    Input Text    ${ADDRESS_FIELD}             ${address}
    Input Text    ${CITY_FIELD}                ${city}
    Input Text    ${STATE_FIELD}               ${state}
    Input Text    ${ZIPCODE_FIELD}             ${zipCode}
    Input Text    ${PHONE_FIELD}               ${phoneNumber}
    Input Text    ${SSN_FIELD}                 ${ssn}
    Input Text    ${NEW_USERNAME_FIELD}        ${username}
    Input Text    ${NEW_PASSWORD_FIELD}        ${password}
    Input Text    ${CONFIRM_PASSWORD_FIELD}     ${password}


Submit Registration Request
    [Documentation]    Clicks the Register button to submit the registration form
    Click Button    ${REGISTER_BUTTON}
    Verify Element Is Visible    ${REGISTER_SUCCESS_MESSAGE}



Verify Registration Success
    [Arguments]    ${ExpectedSuccessMessageText}
    [Documentation]    Verifies that the registration was successful by checking for a success message

    Compare Element Text    ${REGISTER_SUCCESS_MESSAGE}    ${ExpectedSuccessMessageText}
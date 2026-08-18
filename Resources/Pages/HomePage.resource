*** Settings ***
library     SeleniumLibrary
Resource    ../Common/CommonKeyword.resource
resource    register.resource

*** Variables ***
#locators
${REGISTER_LINK}    xpath=//a[text()='Register']





*** Keywords ***

Verify HomePage Loaded
    [Documentation]    Verifies that the Home page is loaded by checking for the presence of the Register link
    Location Should Be    ${URL}  


Navigate To Register Page
    [Documentation]    Navigates to the Register page by clicking on the Register link
    navigate To Page    ${REGISTER_LINK}    ${REGISTER_PAGE_HEADER}
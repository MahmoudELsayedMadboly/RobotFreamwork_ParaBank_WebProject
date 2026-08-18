*** Settings ***
library     SeleniumLibrary
Resource    ../Common/CommonKeyword.resource
resource    register.resource

*** Variables ***
#locators
${REGISTER_LINK}    xpath=//a[contains(@href,'register.htm')]






*** Keywords ***

navigate To Register Page
    [Documentation]    Navigates to the Register page by clicking on the Register link
    navigate To Page    ${REGISTER_LINK}    ${REGISTER_PAGE_HEADER}
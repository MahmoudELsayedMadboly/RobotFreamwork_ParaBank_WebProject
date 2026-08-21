*** Settings ***
Library     SeleniumLibrary
library     String
Resource    ../../Config/Global_Variables.robot
Resource    BrowserKeyword.resource


*** Keywords ***
Capture And Name Screenshot
    [Documentation]    Captures a screenshot named after the currently running test case
    ${safeName}=    Replace String    ${TEST NAME}    ${SPACE}    _
    Capture Page Screenshot    ${safeName}_FAILED_{index}.png



Safe Click
    [Arguments]    ${locator}
    TRY
        Wait Until Element Is Visible    ${locator}    ${StandardWait}
        Wait Until Element Is Enabled    ${locator}    ${StandardWait}
        Click Element    ${locator}
    EXCEPT    AS    ${error}
        Capture And Name Screenshot
        Fail    The issue is:Unable to click element '${locator}': ${error}
    END





Safe Input Text
    [Arguments]    ${locator}    ${text}
    TRY
        Wait Until Element Is Visible    ${locator}    ${StandardWait}
        Wait Until Element Is Enabled    ${locator}    ${StandardWait}
        Clear Element Text    ${locator}
        Input Text    ${locator}    ${text}
    EXCEPT    AS    ${error}
        Capture And Name Screenshot
        Fail    The issue is: Unable to input text into '${locator}': ${error}
    END




Verify Element Is Visible
    [Arguments]    ${locator}
    TRY
        Wait Until Element Is Visible    ${locator}    ${StandardWait}
    EXCEPT    AS    ${error}
        Capture And Name Screenshot
        Fail    The issue is: Element '${locator}' was not visible within ${StandardWait}: ${error}
    END





Navigate To Page
    [Arguments]    ${navigationLocator}    ${destinationPageLocator}
    Safe Click    ${navigationLocator}
    TRY
        Wait Until Page Contains Element    ${destinationPageLocator}    ${StandardWait}
    EXCEPT    AS    ${error}
        Capture And Name Screenshot
        Fail    The issue is: Navigation failed — '${destinationPageLocator}' did not appear: ${error}
    END





Get Element Text
    [Arguments]    ${locator}
    TRY
        Wait Until Element Is Visible    ${locator}    ${StandardWait}
        ${text}=    Get Text    ${locator}
    EXCEPT    AS    ${error}
        Capture And Name Screenshot
        Fail    Unable to get text from '${locator}': ${error}
    END
    RETURN    ${text}





Compare Element Text
    [Arguments]    ${locator}    ${expectedText}
    ${actualText}=    Get Element Text    ${locator}
    TRY
        Should Be Equal    ${actualText}    ${expectedText}
    EXCEPT    AS    ${error}
        Capture And Name Screenshot
        Fail    The issue is:Text mismatch at '${locator}' — expected '${expectedText}' but got '${actualText}'
    END




Generate Unique Username
    [Documentation]    Generates a unique username to avoid duplicate-registration collisions
    ${randomSuffix}=    Generate Random String    6    [LOWER][NUMBERS]
    ${username}=    Catenate    SEPARATOR=    madboly_    ${randomSuffix}
    RETURN    ${username}



Generate Random Password
    [Documentation]    Generates a random password meeting typical complexity rules (upper, lower, digit)
    ${upper}=      Generate Random String    2    [UPPER]
    ${lower}=      Generate Random String    4    [LOWER]
    ${digits}=     Generate Random String    2    [NUMBERS]
    ${password}=   Catenate    SEPARATOR=    ${upper}    ${lower}    ${digits}    @
    RETURN    ${password}

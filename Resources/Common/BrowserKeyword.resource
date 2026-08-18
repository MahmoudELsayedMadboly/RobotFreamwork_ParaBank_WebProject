*** Settings ***
Library     SeleniumLibrary
Resource    ../../Config/Global_Variables.robot


*** Keywords ***

Initialize Browser
    [Arguments]    ${url}=${URL}    ${browser}=${BROWSER}

    Open Browser    ${url}    ${browser}    options=${options}
    Maximize Browser Window
    Sleep    ${StandardWait}

Close Application Browser
    [Documentation]    Closes the browser and ends the session
    Close All Browsers

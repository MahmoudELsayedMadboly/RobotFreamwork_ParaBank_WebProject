*** Settings ***
Library     SeleniumLibrary
Resource    ../../Config/Global_Variables.robot
Resource    ../../Resources/Pages/HomePage.resource
Resource    ../../Resources/Pages/Login.resource
Resource    ../../TestData/Login_Data.robot

*** Keywords ***

Initialize Browser
    [Arguments]    ${url}=${URL}    ${browser}=${BROWSER}
    TRY
    
        Open Browser    ${url}    ${browser}   
        Maximize Browser Window
        Wait Until Keyword Succeeds    ${StandardWait}    ${PingTime}
        ...    Execute Javascript    return document.readyState=="complete"
        Verify HomePage Loaded
        
    EXCEPT    AS    ${error}
        Fail    The issue is: Failed to initialize browser session (url=${url}, browser=${browser}): ${error}
    END




Initialize Browser And Login
        [Arguments]    ${url}=${URL}    ${browser}=${BROWSER}
    TRY
    
        Initialize Browser    
        ...    ${url}    
        ...    ${browser}

        login With User Credentials     
        ...    ${validUsername}    
        ...    ${validPassword}

        Verify Login Success    
        ...    ${ExpectedSuccessHeaderText}       
        
    EXCEPT    AS    ${error}
        Fail    The issue is: Initialize Browser or Login failed: ${error}
    END





Close Application Browser
    [Documentation]    Closes the browser and ends the session
    TRY

        Close All Browsers

    EXCEPT    AS    ${error}
        Log    Browser close encountered an issue (session may already be closed): ${error}    level=WARN
    END

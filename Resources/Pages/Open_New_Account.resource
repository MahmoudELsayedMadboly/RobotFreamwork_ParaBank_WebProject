*** Settings ***
library     SeleniumLibrary
Resource    ../Common/CommonKeyword.resource



*** Variables ***
#locators
${Open_New_Account_Header}    
...    xpath=//h1[text()='Open New Account']
${Open_New_Account_Button}    
...    xpath=//input[@value='Open New Account']
${Account_Type_Dropdown}    
...    id=type
${From_Account_Dropdown}    
...    id=fromAccountId
${New_Account_Creation_Header}    
...    xpath=//div[@id='openAccountResult']//h1[text()='Account Opened!']
${OPEN_ACCOUNT_SUCCESS_MESSAGE}    
...    xpath=//div[@id='openAccountResult']/p[text()='Congratulations, your account is now open.']
${NEW_ACCOUNT_LABEL}    
...    xpath=//div[@id='openAccountResult']//b[text()='Your new account number:']
${NEW_ACCOUNT_ID}    
...    id=newAccountId




*** Keywords *** 

Open New Account
    [Arguments]    
    ...    ${accountType}        
    ...    ${SelectionStrategy_ForAccontType}       
    ...    ${SelectionStrategy_ForAccountList}    

#select account type "checking - saving"
    Safe Select From List    
    ...    ${Account_Type_Dropdown}    
    ...    ${SelectionStrategy_ForAccontType}    
    ...    ${accountType}    


#select the account will deduct from
    Safe Select From List    
    ...    ${From_Account_Dropdown}    
    ...    ${SelectionStrategy_ForAccountList}    
    ...    ${accountType}          


     Safe Click    
    ...    ${Open_New_Account_Button}




Verify The New Account Created Successfully
    [Arguments]    
    ...    ${Open_Account_Expected_Success_Message}
    
    Verify Element Is Visible    
    ...    ${New_Account_Creation_Header}

    Compare Element Text    
    ...    ${OPEN_ACCOUNT_SUCCESS_MESSAGE}    
    ...    ${Open_Account_Expected_Success_Message} 



Verify The New Account Number Is Shown
    
    Verify Element Is Visible    
    ...    ${NEW_ACCOUNT_LABEL}

    ${accountId}=    Get Element Text    
    ...    ${NEW_ACCOUNT_ID}

    Verify Element Is Not Empty   
    ...    ${accountId}

    Should Match Regexp    
    ...    ${accountId}    ^[0-9]+$

    RETURN    ${accountId}  
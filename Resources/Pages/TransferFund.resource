*** Settings ***
library     SeleniumLibrary
Resource    ../Common/CommonKeyword.resource
Resource    ../Pages/Account_Overview.resource



*** Variables ***
#locators



*** Keywords ***

Note Sender Account
    [Arguments]    ${accountBalance}
    ${accountId}    ${balance}=    Get Account With Sufficient Balance    ${accountBalance}
    RETURN    ${accountId}    ${balance}   



Note Reciever Account


Transfer Fund


Verify the Fund Transferred Successfully
















#ToAccount >> the created one
#FromAccount >> loop inside table & get:
# - account with balance > 0
# - catch its balance
# - then transfer fund
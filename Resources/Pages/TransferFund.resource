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
    [Documentation]    Opens a fresh receiver account once per suite, stores its ID for reuse across all transfer test cases
    Initialize Browser And Login
    ${receiverId}=    Note Reciever Account
    Set Suite Variable    ${TRANSFER_RECEIVER_ID}    ${receiverId}
    Close Application Browser






Transfer Fund


Verify the Fund Transferred Successfully
















#ToAccount >> the created one
#FromAccount >> loop inside table & get:
# - account with balance > 0
# - catch its balance
# - then transfer fund
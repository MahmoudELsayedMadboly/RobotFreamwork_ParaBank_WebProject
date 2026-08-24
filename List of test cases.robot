Core flows worth automating:
----------------------------
1- User Registration    "Done"
    Register a new customer with all required fields (name, address, SSN, username, password)
    Verify successful registration and auto-login/redirect to account overview

2- Login    "Done"
    Valid credentials → successful login
    Invalid credentials → appropriate error message
    Empty username/password → validation message

3- Account Overview
    Verify accounts list displays after login
    Verify account balance shown correctly

4- Open New Account    "in progress"
    Open a new Checking or Savings account
    Verify new account ID appears in Account Overview

5- Transfer Funds
    Transfer money between two of the user's own accounts
    Verify balance updates correctly on both accounts after transfer

6- Bill Pay
    Pay a bill to a payee (name, address, account, amount)
    Verify confirmation message and transaction appears in history

7- Find Transactions
    Search transactions by date, amount, or transaction ID
    Verify correct results returned

8- Update Contact Info
    Edit profile details (address, phone, email)
    Verify changes persisted

9- Request Loan
    Submit a loan request with amount and down payment
    Verify approval/denial response

10- Logout
    Verify session ends and redirects to login page
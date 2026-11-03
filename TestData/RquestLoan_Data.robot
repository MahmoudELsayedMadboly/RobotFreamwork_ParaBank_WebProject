*** Variables ***
# Positive case: down payment is smaller than the new user's balance (about 515.50)
${LOAN_AMOUNT_VALID}             1000
${LOAN_DOWN_PAYMENT_VALID}       200

# Negative case: down payment is far bigger than the account balance
${LOAN_AMOUNT_EXCESSIVE}         5000
${LOAN_DOWN_PAYMENT_EXCESSIVE}   1000000

# Expected results (unique LOAN_ names so they never collide with other data files)
${LOAN_STATUS_APPROVED}          Approved
${LOAN_STATUS_DENIED}            Denied
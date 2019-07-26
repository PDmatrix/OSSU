balance = 4773
annualInterestRate = 0.2

prev_balance = balance
payment = 0
while prev_balance > 0:
    prev_balance = balance
    payment += 10
    for i in range(12):
        monthlyInterestRate = annualInterestRate / 12.0
        monthlyUnpaidBalance =  prev_balance - payment# (Previous balance) - (Minimum fixed monthly payment) 
        prev_balance = monthlyUnpaidBalance + (monthlyInterestRate * monthlyUnpaidBalance)

print("Lowest Payment: " + str(payment))
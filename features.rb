require './lib/bank_account.rb'
bank = BankAccount.new
bank.deposit(2000)
bank.withdraw(1000)
bank.current_balance
bank.print_statement

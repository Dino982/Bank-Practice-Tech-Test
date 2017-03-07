require './lib/bank_account.rb'
require './lib/statement_printer.rb'
transaction_log = TransactionLog.new
bank = BankAccount.new(transaction_log)
bank.deposit(2000)
bank.withdraw(1000)
bank.current_balance
statement = StatementPrinter.new
statement.print_statement(transaction_log)

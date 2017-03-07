require './lib/transaction_log.rb'
require './lib/statement_printer.rb'
t = TransactionLog.new
t.create(1000,1000)
t.create(-200,800)
s = StatementPrinter.new
s.print_statement(t)

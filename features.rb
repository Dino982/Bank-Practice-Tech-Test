require './lib/transaction_log.rb'
t = TransactionLog.new
t.create(10,100)
t.create(-20,80)

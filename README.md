# Bank Practice Tech Test in Ruby
[![Coverage Status](https://coveralls.io/repos/github/mbgimot/Bank-Practice-Tech-Test/badge.svg?branch=master)](https://coveralls.io/github/mbgimot/Bank-Practice-Tech-Test?branch=master)
[![Build Status](https://travis-ci.org/mbgimot/Bank-Practice-Tech-Test.svg?branch=master)](https://travis-ci.org/mbgimot/Bank-Practice-Tech-Test)

Requirements
-----
* You should be able to interact with the your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).

Acceptance Criteria
-----
Given a client makes a deposit of 1000 on 10-01-2012 And a deposit of 2000 on 13-01-2012 And a withdrawal of 500 on 14-01-2012 When she prints her bank statement Then she would see:

```
date       || credit || debit   || balance
14/01/2012 ||        || 500.00  || 2500.00
13/01/2012 || 2000.00||         || 3000.00
10/01/2012 || 1000.00||         || 1000.00
```

Instructions
-----
To Install:
```
git clone https://github.com/mbgimot/Bank-Practice-Tech-Test.git
bundle
rspec
```

Interaction with IRB:
```
$ irb
2.3.0 :001 > require './lib/bank_account.rb'
 => true
2.3.0 :002 > require './lib/statement_printer.rb'
 => true
2.3.0 :003 > transaction_log = TransactionLog.new
 => #<TransactionLog:0x007ff1b2826828 @transactions={}, @transaction_class=Transaction>
2.3.0 :004 > bank = BankAccount.new(transaction_log)
 => #<BankAccount:0x007ff1b2b53cf8 @balance=0, @transaction_log=#<TransactionLog:0x007ff1b2826828 @transactions={}, @transaction_class=Transaction>>
2.3.0 :005 > bank.deposit(2000)
 => 2000
2.3.0 :006 > bank.withdraw(1000)
 => 1000
2.3.0 :007 > bank.current_balance
 => "Your balance is £1000"
2.3.0 :008 > statement = StatementPrinter.new
 => #<StatementPrinter:0x007ff1b2b33700>
2.3.0 :009 > statement.print_statement(transaction_log)
date       || credit   || debit    || balance
07/03/2017 || 2000.00  ||          || 2000.00
07/03/2017 ||          || 1000.00  || 1000.00

```

User Stories
-----
```
As a user,
I would like to make a deposit,
So that I can add income to my account.

As a user,
I would like to make a withdrawal,
So that I can spend my hard earned money.

As a user,
I would like to see my account's statement,
So that I can see the balance of my account.

As a bank,
I would like to stop customers having a negative balance,
So we always don't accidentally give a customer a credit line.
```

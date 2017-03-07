require_relative 'transaction_log'
require_relative 'statement_printer'

class BankAccount
  attr_reader :balance

  DEFAULT_BALANCE = 0

  def initialize(intial_balance = DEFAULT_BALANCE)
    @balance = intial_balance
    @transaction_log = TransactionLog.new
    @statement_printer = StatementPrinter.new
  end

  def deposit(amount)
    @balance += amount
    @transaction_log.create(amount, balance)
  end

  def withdraw(amount)
    raise "Insufficient funds" if amount > @balance
    @balance -= amount
    @transaction_log.create(-amount, balance)
  end

  def print_statement
    @statement_printer.print_statement(@transaction_log)
  end

  def current_balance
    "Your balance is £#{@balance}"
  end
end

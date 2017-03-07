require_relative 'transaction_log'

class BankAccount
  attr_reader :balance

  DEFAULT_BALANCE = 0

  def initialize(transaction_log = TransactionLog.new, balance = DEFAULT_BALANCE)
    @balance = balance
    @transaction_log = transaction_log
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

  def current_balance
    "Your balance is £#{@balance}"
  end
end

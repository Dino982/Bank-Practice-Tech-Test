require_relative 'transaction_log'

class BankAccount
  attr_reader :balance

  DEFAULT_BALANCE = 0

  def initialize(intial_balance = DEFAULT_BALANCE)
    @balance = intial_balance
    @transaction_log = TransactionLog.new
  end

  def deposit(amount)
    @balance += amount
    @transaction_log.create(amount, balance)
  end

  def withdraw(amount)
    raise "Insufficient funds" if amount > @balance
    @balance -= amount
    @transaction_log.create(amount, balance)
  end

  def current_balance
    "Your balance is £#{@balance}"
  end
end

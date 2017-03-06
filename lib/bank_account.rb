class BankAccount
  attr_reader :balance

  DEFAULT_BALANCE = 0

  def initialize(intial_balance = DEFAULT_BALANCE)
    @balance = intial_balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    raise "Insufficient funds" if amount > @balance
    @balance -= amount
  end

  def current_balance
    "Your balance is £#{@balance}"
  end
end

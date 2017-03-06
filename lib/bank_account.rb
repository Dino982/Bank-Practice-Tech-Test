class BankAccount
  attr_reader :balance

  DEFAULT_BALANCE = 0

  def initialize(intial_balance = DEFAULT_BALANCE)
    @balance = intial_balance
  end

  def deposit(amount)
    @balance += amount
  end
end

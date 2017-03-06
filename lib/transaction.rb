class Transaction
  attr_reader :amount, :date, :type

  def initialize(amount, date = Time.new)
    amount_checker(amount)
    @date = date
    set_type
  end

  private

  def set_type
    @amount > 0 ? @type = :credit : @type = :debit
  end

  def amount_checker(amount)
    raise "Transaction amount cannot be 0" if amount == 0
    @amount = amount
  end
end

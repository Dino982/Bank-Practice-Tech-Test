class Transaction
  attr_reader :amount, :date, :type

  def initialize(amount, date = Time.new)
    @amount = amount
    @date = date
    set_type
  end

  private

  def set_type
    @amount > 0 ? @type = :credit : @type = :debit
  end
end

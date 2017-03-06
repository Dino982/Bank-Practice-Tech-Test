class Transaction
  attr_reader :amount, :date

  def initialize(amount, date = Time.new)
    @amount = amount
    @date = date
  end
end

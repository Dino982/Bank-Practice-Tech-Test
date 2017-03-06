class Transaction
  attr_reader :amount
  
  def initialize(amount)
    @amount = amount
    @date = Time.new
  end
end

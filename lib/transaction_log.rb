class TransactionLog
  def initialize
    @transactions = []
  end

  def get_transactions
    @transactions.dup
  end
end

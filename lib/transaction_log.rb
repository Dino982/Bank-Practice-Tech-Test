require_relative 'transaction'

class TransactionLog
  def initialize
    @transactions = []
  end

  def transaction_history
    @transactions.dup
  end

  def add_transaction(transaction)
    @transactions << transaction
  end
end

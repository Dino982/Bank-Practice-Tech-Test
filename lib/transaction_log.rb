require_relative 'transaction'

class TransactionLog
  attr_reader :transactions

  def initialize(transaction_class = Transaction)
    @transactions = {}
    @transaction_class = transaction_class
  end

  def create(amount, balance)
    store(@transaction_class.new(amount), balance)
  end

  def print_history

  end


  # private

  def store(transaction, balance)
    @transactions[transaction] = balance
  end

  def header
    "date || credit || debit || balance\n"
  end

  def statement_content
    trial = @transactions.sort_by {|transaction| transaction.date}.reverse
    p trial
  end

end

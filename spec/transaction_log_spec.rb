require 'transaction_log'

describe TransactionLog do
  subject(:log) {described_class.new}

  describe '#initialize' do
    it 'initialises with a empty array of transactions' do
      expect(log.transactions).to be_empty
    end
  end
end

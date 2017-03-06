require 'transaction_log'

describe TransactionLog do
  subject(:log) {described_class.new}

  describe '#get_transactions' do
    it 'initialises with a empty array of transactions' do
      expect(log.get_transactions).to be_empty
    end
  end
end

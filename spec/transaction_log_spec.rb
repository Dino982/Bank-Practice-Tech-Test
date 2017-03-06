require 'transaction_log'
require 'transaction'

describe TransactionLog do
  subject(:log) {described_class.new}
  let(:transaction) {double :transaction}

  describe '#get_transactions' do
    it 'initialises with a empty array of transactions' do
      expect(log.get_transactions).to be_empty
    end
  end
end

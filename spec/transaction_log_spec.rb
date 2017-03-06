require 'transaction_log'
require 'transaction'

describe TransactionLog do
  subject(:log) {described_class.new}
  let(:transaction) {double :transaction}

  before do
    allow(transaction).to receive(:amount){10}
  end


  describe '#transaction_history' do
    it 'initialises with a empty array of transactions' do
      expect(log.transaction_history).to be_empty
    end
  end

  describe '#get_transaction' do
    it 'stores a transaction' do
      log.add_transaction(transaction)
      expect(log.transaction_history).to include(transaction)
    end
  end



end

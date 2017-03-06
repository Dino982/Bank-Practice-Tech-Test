require 'transaction_log'
require 'transaction'

describe TransactionLog do
  let(:transaction) {double :transaction}
  let(:transaction_class) {double(:transaction_class, new: transaction)}
  subject(:log) {described_class.new(transaction_class)}

  before do
    allow(transaction).to receive(:amount){10}
  end


  describe '#transaction' do
    it 'initialises with a empty array of transactions' do
      expect(log.history).to be_empty
    end
  end

  describe '#create' do
    it 'stores a transaction' do
      log.create(10, 1000)
      expect(log.history).to include(transaction)
    end
  end



end

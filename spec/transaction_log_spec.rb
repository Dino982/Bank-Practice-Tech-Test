require 'transaction_log'
require 'transaction'

describe TransactionLog do
  let(:transaction) {double :transaction}
  let(:transaction_class) {double(:transaction_class, new: transaction)}
  subject(:log) {described_class.new(transaction_class)}

  before do
    allow(transaction).to receive(:amount){10}
    allow(transaction).to receive(:balance){1000}
  end


  describe '#history' do
    it 'initialises with a empty array of transactions' do
      expect(log.transactions).to be_empty
    end

    it 'stores a transactions amount' do
      log.create(10, 1000)
      expect(log.transactions.keys[0].amount).to eq(10)
    end

    it 'stores the current balance' do
      log.create(10, 1000)
      expect(log.transactions.values[0]).to eq(1000)
    end
  end

  describe '#create' do
    it 'creates a transaction' do
      log.create(10, 1000)
      expect(log.transactions).to include(transaction)
    end
  end
end

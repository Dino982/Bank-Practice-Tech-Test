require 'transaction'

describe Transaction do
  subject(:transaction) {described_class.new(10)}

  describe '#initialize' do
    it 'has an amount' do
      expect(transaction.amount).to eq(10)
    end
  end

end

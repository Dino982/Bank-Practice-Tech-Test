require 'transaction'

describe Transaction do
  before do
    @t = Time.local(2017, 3, 6, 12, 0, 0)
    Timecop.freeze(@t)
  end

  subject(:transaction) {described_class.new(10, @t)}

  describe '#initialize' do
    it 'has an amount' do
      expect(transaction.amount).to eq(10)
    end

    it 'has timestamp' do
      expect(transaction.date).to eq(@t)
    end
  end

end

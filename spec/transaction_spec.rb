require 'transaction'

describe Transaction do
  before do
    @t = Time.local(2017, 3, 6, 12, 0, 0)
    Timecop.freeze(@t)
  end

  subject(:credit) {described_class.new(10, @t)}
  subject(:debit) {described_class.new(-10, @t)}

  describe '#initialize' do
    it 'has an amount' do
      expect(credit.amount).to eq(10)
    end

    it 'has timestamp' do
      expect(credit.date).to eq(@t)
    end
  end

  describe 'type' do
    it 'should be a credit if amount is greater than 0' do
      expect(credit.type).to eq(:credit)
    end

    it 'should be a debit if amount is less than 0' do
      expect(debit.type).to eq(:debit)
    end
  end

end

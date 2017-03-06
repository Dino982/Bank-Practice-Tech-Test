require 'transaction'

describe Transaction do
  before do
    @t = Time.local(2017, 3, 6, 12, 0, 0)
    Timecop.freeze(@t)
  end

  subject(:credit) {described_class.new(10, @t)}
  subject(:debit) {described_class.new(-10, @t)}
  amount_error = "Transaction amount cannot be 0"
  type_error = "Transaction amount must be a number"

  describe '#initialize' do
    it 'has an amount' do
      expect(credit.amount).to eq(10)
    end

    it 'has timestamp' do
      expect(credit.date).to eq(@t)
    end

    it 'throws an error if amount is 0' do
      expect{Transaction.new(0)}.to raise_error(amount_error)
    end
    it 'throws an error if amount is NaN' do
      expect{Transaction.new('test')}.to raise_error(type_error)
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

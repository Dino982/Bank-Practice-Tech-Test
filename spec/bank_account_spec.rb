require 'bank_account'

describe BankAccount do
  DEFAULT_BALANCE = BankAccount::DEFAULT_BALANCE
  subject(:account) {described_class.new}

  describe '#initialize' do
    it 'creates a new bank account with a default balance of 0' do
      expect(account.balance).to eq(DEFAULT_BALANCE)
    end
  end

  describe '#deposit' do
    it 'increases the account\'s balance' do
      account.deposit(1000)
      expect(account.balance).to eq(1000)
    end
  end

  describe '#withdraw' do
    before {account.deposit(2000)}

    it 'lowers the account\'s balance' do
      account.withdraw(1000)
      expect(account.balance).to eq(1000)
    end
  end


end

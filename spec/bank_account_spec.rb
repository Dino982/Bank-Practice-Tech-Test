require 'bank_account'

describe BankAccount do
  DEFAULT_BALANCE = BankAccount::DEFAULT_BALANCE
  balance_error = "Insufficient funds"
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

    it 'raises an error if the withdrawal amount exceeds the user\'s current balance' do
      expect{account.withdraw(2001)}.to raise_error(balance_error)
    end
  end

  describe '#current_balance' do
    it 'prints the the user\'s currents balance' do
      account.deposit(2000)
      expect(account.current_balance).to eq("Your balance is £2000")
    end
  end
end

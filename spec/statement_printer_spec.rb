require 'statement_printer'

describe StatementPrinter do
  before do
    @t = Time.local(2017, 3, 7, 12, 0, 0)
    Timecop.freeze(@t)
    @t2 = Time.local(2017, 3, 7, 10, 0, 0)
    Timecop.freeze(@t2)
  end

  let(:credit) {double(:transaction, amount: 1000, date: @t, type: :credit)}
  let(:debit) {double(:transaction, amount: -2000, date: @t2, type: :debit)}
  let(:transaction_log) {instance_double("TransactionLog")}
  subject(:statement) {described_class.new}

  describe '#print_statement' do
    it 'prints out the statement with header' do
      allow(transaction_log).to receive(:transactions){{credit => 1000, debit => 800}}
      result = "date       || credit   || debit    || balance\n07/03/2017 || 1000.00  ||          || 1000.00\n07/03/2017 ||          || 2000.00  || 800.00"
      expect(STDOUT).to receive(:puts).with(result)
      statement.print_statement(transaction_log)
    end
  end

end

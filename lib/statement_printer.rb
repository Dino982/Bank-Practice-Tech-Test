class StatementPrinter
  CREDIT_DEBIT_JUST = 8
  DATE_JUST = 10

  def initialize
  end

  def print_statement(transaction_log)
    @transaction_log = transaction_log
    puts header + printer
  end

  private

  def header
    date = "date".ljust(DATE_JUST)
    credit = "credit".ljust(CREDIT_DEBIT_JUST)
    debit = "debit".ljust(CREDIT_DEBIT_JUST)
    balance = "balance\n"
    spacer = " || "

    date + spacer + credit + spacer + debit + spacer + balance
  end

  def statement
    @transactions = []
    @transaction_log.transactions.each do |tr, balance|
      @transactions << "#{date(tr)} || #{add_credit(tr)} || #{add_debit(tr)} || #{sprintf('%.2f', balance)}"
    end
  end

  def printer
    statement
    @transactions.map {|tr| "#{tr}"}.join("\n")
  end

  def date(tr)
    tr.date.strftime("%d/%m/%Y").ljust(DATE_JUST)
  end

  def add_credit(tr)
    str = ""
    tr.type == :credit ? "#{sprintf('%.2f', tr.amount)} " : str.ljust(CREDIT_DEBIT_JUST)
  end

  def add_debit(tr)
    str = ""
    tr.type == :debit ? "#{sprintf('%.2f', -tr.amount)} " : str.ljust(CREDIT_DEBIT_JUST)
  end
end

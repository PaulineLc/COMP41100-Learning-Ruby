class Bank
  attr_accessor :name, :nb_employees, :cash_deposits_amt, :loans_amt, :loss_amt, :in_nama, :solvent

  def initialize(name, nb_employees, cash_deposits_amt, loans_amt=0, loss_amt=0)
    @name = name
    @nb_employees = nb_employees
    @cash_deposits_amt = cash_deposits_amt
    @loans_amt = loans_amt
    @loss_amt = loss_amt
    @in_nama = 0
    @solvent = solvent?
  end

  def solvent?
    #since that method returns a boolean, I decided to remove the is_ as it is bad practice
    #(ref: Ruby Style Guide https://github.com/bbatsov/ruby-style-guide#naming)
    @loans_amt < 6 * (@cash_deposits_amt - @loss_amt)
  end

  def move_loans_to_nama(amt, bad_bank)
    @loans_amt -= amt
    @in_nama += amt
    @cash_deposits_amt += 0.3 * amt
    bad_bank.loans_amt += amt
    bad_bank.cash_deposits_amt -= 0.3 * amt
  end

  def make_solvent(transfer_loans_to)
    if !@solvent
      amt_to_transfer = @loans_amt - (6 * (@cash_deposits_amt - @loss_amt))
      move_loans_to_nama(amt_to_transfer, transfer_loans_to)
      puts @name + ': A total of ' + amt_to_transfer.to_s + ' million euros have been moved to ' + transfer_loans_to.name
    else puts name + ' is already solvent.'
    end
  end

  def to_s
    puts '*******************************'
    puts 'BANK PROFILES'
    puts '*******************************'
    puts "#{@name}"
    puts "employees:\t#{nb_employees}"
    puts "deposits:\t#{@cash_deposits_amt}"
    puts "loans:\t\t#{@loans_amt}"
    puts "loss:\t\t#{@loss_amt}"
    puts "in NAMA:\t#{@in_nama}"
    puts "solvent:\t#{@solvent}"
    puts '*******************************'
  end

end

aib = Bank.new('AIB', 10000, 15, 1, 0.5)
anglo = Bank.new('Anglo', 8000, 10, 35, 5)
boi = Bank.new('Bank of Ireland', 11000, 13, 40, 1)
rbs = Bank.new('RBS', 92000, 45, 90, 10)
ulster = Bank.new('Ulster Bank', 3500, 5, 40, 0)
nama = Bank.new('NAMA', 200, 240)
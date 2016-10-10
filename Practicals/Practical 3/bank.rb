class Bank
  attr_accessor :name, :nb_employees, :cash_deposits_amt, :loans_amt, :loss_amt, :in_nama, :solvent, :bad_bank

  def initialize(name, nb_employees, cash_deposits_amt, loss_amt, loan_amt, bad_bank)
    @name = name
    @nb_employees = nb_employees
    @cash_deposits_amt = cash_deposits_amt
    @loss_amt = loss_amt
    @loans_amt = loan_amt
    @bad_bank = bad_bank
    @in_nama = 0
    @solvent = solvent?
  end

  def solvent?
    #since that method returns a boolean, I decided to remove the is_ as it is bad practice
    #(ref: Ruby Style Guide https://github.com/bbatsov/ruby-style-guide#naming)
    @loans_amt < 6 * (@cash_deposits_amt - @loss_amt)
  end

  def move_loans_to_nama
    transferred = 0
    while !solvent && @loans_amt > 0 do
      #puts "working..."
      @loans_amt -= 1
      @in_nama += 1
      transferred += 1
      @solvent = solvent?
    end
    @cash_deposits_amt += 0.3 * transferred
    @bad_bank.loans_amt += transferred
    @bad_bank.cash_deposits_amt -= 0.3 * transferred
    puts "#{@name}: A total of #{transferred} million euros have been moved to #{get_bad_bank_name}"
  end

  def make_solvent
    @solvent = solvent?
    if !@solvent
      puts "#{@name}: bankrupcy confirmed."
      move_loans_to_nama
    else puts name + ': still solvent.'
    end
  end

  def to_s
    puts '*******************************'
    puts 'BANK PROFILE'
    puts '*******************************'
    puts "#{@name}"
    puts "employees:\t#{nb_employees}"
    puts "cash:\t\t#{@cash_deposits_amt.round}"
    puts "loss:\t\t#{@loss_amt.round}"
    puts "loans:\t\t#{@loans_amt.round}"
    puts "in NAMA:\t#{@in_nama.round}"
    puts "solvent:\t#{@solvent}"
    puts "bad bank:\t#{get_bad_bank_name}"
    '*******************************'
  end

  def get_bad_bank_name
    if @bad_bank == nil
      @name
    else @bad_bank.name
    end

  end

end
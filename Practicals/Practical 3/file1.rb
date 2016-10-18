class Bank
  attr_accessor :name, :number_of_employees, :cash_deposits, :amount_of_loans, :losses, :in_nama, :solvent

  def initialize(name, no_of_employees, cash_deposits, amount_of_loans, losses, in_nama, solvent)
    @name, @no_of_employees, @cash_deposits, @amount_of_loans, @losses, @in_nama, @solvent = name, no_of_employees, cash_deposits, amount_of_loans, losses, in_nama, solvent
  end

  def self.create_bank(bank_name, bank_details)
    banks = []
    for i in 0...bank_name.length
      banks << Bank.new(bank_name[i],
                        bank_details[i][0].to_i, #no_of_employees
                        bank_details[i][1].to_f, #cash_deposits
                        bank_details[i][2].to_f, #amount_of_loans
                        bank_details[i][3].to_f, #losses
                        bank_details[i][4].to_f, #in_nama
                        bank_details[i][5] == 'true') #solvent #transform string to bool; inspired from: #https://stackoverflow.com/questions/8119970/string-true-and-false-to-boolean
    end
    banks
  end

  def solvent?(loans_to_transfer = 0)
    #since that method returns a boolean, I decided to remove the is_ as it is bad practice
    #(ref: Ruby Style Guide https://github.com/bbatsov/ruby-style-guide#naming)
    (@amount_of_loans - loans_to_transfer) < 6 * (@cash_deposits - @losses)
  end

  def self.move_loans_to_nama(bank, loans_to_move, nama)
    bank.amount_of_loans -= loans_to_move
    nama.amount_of_loans += loans_to_move
    nama.cash_deposits -= 0.3 * loans_to_move
    bank.cash_deposits += 0.3 * loans_to_move
    bank.solvent = bank.solvent?
    puts "A total of #{loans_to_move}M Euros have been moved from #{bank.name} to #{nama.name}"
  end

  def make_solvent
    loans_to_transfer = 0
    @solvent = solvent?
    while !@solvent && @amount_of_loans > 0 do
      loans_to_transfer += 1
      @solvent = solvent?(loans_to_transfer)
    end
    @solvent = solvent?
    if loans_to_transfer <= 0
      then puts "There is no need to transfer any loan from #{@name} to NAMA at the moment."
    else puts "A total of #{loans_to_transfer}M Euros worth of loans need to be transferred from #{@name} to NAMA"
    end
    loans_to_transfer
  end

  def to_s
    puts '*******************************'
    puts 'BANK PROFILE'
    puts '*******************************'
    puts "#{@name}"
    puts "employees:\t\t\t\t#{@no_of_employees}"
    puts "cash deposits:\t\t\t#{@cash_deposits.round}"
    puts "Amount of loans:\t\t#{@amount_of_loans.round}"
    puts "Losses:\t\t\t\t\t#{@losses.round}"
    puts "in NAMA:\t\t\t\t#{@in_nama.round}"
    puts "solvent:\t\t\t\t#{@solvent}"
    '*******************************'
  end

end
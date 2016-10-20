class Bank
  attr_accessor :number_of_employees, :cash_deposits, :amount_of_loans, :losses, :in_nama, :solvent

  def initialize(no_of_employees, cash_deposits, amount_of_loans, losses, in_nama, solvent)
    @no_of_employees, @cash_deposits, @amount_of_loans, @losses, @in_nama, @solvent = no_of_employees, cash_deposits, amount_of_loans, losses, in_nama, solvent
  end

  def self.create_bank(bank_name, bank_details)
    banks = {}
    for i in 0...bank_name.length
      banks[bank_name[i]] = Bank.new(bank_details[i][0].to_i, #no_of_employees
                                     bank_details[i][1].to_f, #cash_deposits
                                     bank_details[i][2].to_f, #amount_of_loans
                                     bank_details[i][3].to_f, #losses
                                     bank_details[i][4].to_f, #in_nama
                                     bank_details[i][5] == 'true') #solvent #transform string to bool; inspired from: #https://stackoverflow.com/questions/8119970/string-true-and-false-to-boolean
    end
    #returns a dictionary where keys are the banks' name and values hold a reference to their object
    banks
  end

  def solvent?(loans_to_transfer = 0, additional_cash_deposit = 0)
    #since that method returns a boolean, I decided to remove the is_ as it is bad practice
    #(ref: Ruby Style Guide https://github.com/bbatsov/ruby-style-guide#bool-methods-prefix)

    #returns a boolean
    #the 2 optional arguments are used by make_solvent to calculate how many loans need to be moved to be made solvent
    (@amount_of_loans - loans_to_transfer) < 6 * (@cash_deposits + additional_cash_deposit - @losses)
  end

  def self.move_loans_to_nama(bank, loans_to_move, nama)
    #takes a bank, a loan amount, and nama
    #takes the loan amount away from the bank and adds it to nama
    #takes some cash out of nama and adds it to the bank's cash deposit
    #after these transfers, check if the bank is solvent
    bank.amount_of_loans -= loans_to_move
    nama.amount_of_loans += loans_to_move
    nama.cash_deposits -= 0.3 * loans_to_move
    bank.cash_deposits += 0.3 * loans_to_move
    bank.solvent = bank.solvent?
    puts "A total of #{loans_to_move}M Euros have been moved to NAMA"
  end

  def make_solvent
    #calculate the amount of loans to be moved to NAMA in order to be solvent
    #ensure that the bank doesn't transfer to NAMA more loans than it has
    #returns the amount of loans to be transferred
    loans_to_transfer = 0
    @solvent = solvent?

    if !@solvent
      while !(solvent?(loans_to_transfer, 0.3 * loans_to_transfer)) && @amount_of_loans > 0 do
        loans_to_transfer += 1
      end
      puts "A total of #{loans_to_transfer}M Euros worth of loans need to be transferred to NAMA"
    else
      puts 'There is no need to transfer any loan to NAMA at the moment.'
    end
    loans_to_transfer
  end

  def to_s
    puts '*******************************'
    puts 'BANK PROFILE'
    puts '*******************************'
    puts "employees:\t\t\t\t#{@no_of_employees}"
    puts "cash deposits:\t\t\t#{@cash_deposits.round(2)}"
    puts "Amount of loans:\t\t#{@amount_of_loans.round(2)}"
    puts "Losses:\t\t\t\t\t#{@losses.round(2)}"
    puts "in NAMA:\t\t\t\t#{@in_nama.round(2)}"
    puts "solvent:\t\t\t\t#{@solvent}"
    '*******************************'
  end

end

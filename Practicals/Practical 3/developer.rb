class Developer
  attr_accessor :name, :net_worth, :loans, :bank_loaned_from, :bankrupt

  def initialize(name, net_worth, loans, bank_loaned_from)
    @name = name
    @net_worth = net_worth
    @loans = loans
    @bank_loaned_from = bank_loaned_from
    @bankrupt = !solvent?
  end

  def solvent?
    #since that method returns a boolean, I decided to remove the is_ as it is bad practice
    #(ref: Ruby Style Guide https://github.com/bbatsov/ruby-style-guide#naming)
    @net_worth > @loans
  end

  def owes_amount
    @loans
  end

  def owes_bank
    @bank_loaned_from
  end

  def make_loans_void
    if bankrupt
      puts "#{@name}: Bankrupty confirmed."
      puts "#{@name}: Adding #{@name}'s loans (#{@loans} million Euros) to #{@bank_loaned_from.name}'s losses..."
      puts "\n"
      @bank_loaned_from.loss_amt += @loans
      @bank_loaned_from.make_solvent
      puts "\n"
    else
      puts "#{@name} is not bankrupt (yet)"
      puts "\n"
    end
  end

  def to_s
    puts '*******************************'
    puts 'DEVELOPER PROFILE'
    puts '*******************************'
    puts "name:\t\t\t\t#{@name}"
    puts "net worth:\t\t\t#{@net_worth}"
    puts "loans:\t\t\t\t#{@loans}"
    puts "bank loaned from:\t#{@bank_loaned_from.name}"
    puts "bankupt:\t\t\t#{@bankrupt}"
    '*******************************'
  end

end


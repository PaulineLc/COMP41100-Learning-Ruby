class Developer
  attr_accessor :name, :net_worth, :loans, :bank_loaned_from, :bankrupt

  def initialize(name, net_worth, loans, bank_loaned_from, bankrupt)
    @name, @net_worth, @loans, @bank_loaned_from, @bankrupt = name, net_worth, loans, bank_loaned_from, bankrupt
  end

  def self.create_developer(csv_file)
    #takes details from a file and returns a array of all developers
    developers = []
    csv_file.each do |dev|
      developers << Developer.new(dev[0], #name
                                  dev[1].to_f, #net_worth
                                  dev[2].to_f, #loans
                                  dev[3], #bank_loaned_from
                                  dev[4] == 'true') #bankrupt (boolean)
    end
    developers
  end

  def solvent?
    #since that method returns a boolean, I decided to remove the is_ as it is bad practice
    #(ref: Ruby Style Guide https://github.com/bbatsov/ruby-style-guide#naming)

    #check if developer is solvent
    #a developer is solvent if its net worth is more important than its loans
    @net_worth >= @loans
  end

  def owes_bank
    #getter method
    @bank_loaned_from
  end

  def owes_amount
    #getter method
    @loans
  end

  def to_s
    puts '*******************************'
    puts 'DEVELOPER PROFILE'
    puts '*******************************'
    puts "name:\t\t\t\t#{@name}"
    puts "net worth:\t\t\t#{@net_worth}"
    puts "loans:\t\t\t\t#{@loans}"
    puts "bank loaned from:\t#{@bank_loaned_from}"
    puts "bankupt:\t\t\t#{@bankrupt}"
    '*******************************'
  end

end
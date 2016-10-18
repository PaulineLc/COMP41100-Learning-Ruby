class Developer
  attr_accessor :name, :net_worth, :loans, :bank_loaned_from, :bankrupt

  def initialize(name, net_worth, loans, bank_loaned_from, bankrupt)
    @name, @net_worth, @loans, @bank_loaned_from, @bankrupt = name, net_worth, loans, bank_loaned_from, bankrupt
  end

  def self.create_developer(csv_file)
    developers = []
    csv_file.each do |dev|
      developers << Developer.new(dev[0], dev[1], dev[2], dev[3], dev[4])
    end
    developers
  end

  def developer_solvent?
    @net_worth >= @loans
  end

  def owes_bank
    @bank_loaned_from
  end

  def owes_amount
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
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
end


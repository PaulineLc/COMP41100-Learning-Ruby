require 'csv'
require_relative 'file1'
require_relative 'file2'

def declared_bankrupt(banks, developers)
  developers.each do |dev|
    if !(dev.solvent?)
      dev.bankrupt = true
      puts "#{dev.name} has been declared bankrupt."
      puts "#{dev.name}'s loans (#{dev.loans.round}M Euros) will be declared void."
      puts "#{dev.name}'s had loans from #{dev.bank_loaned_from.upcase}"
      puts ''
      puts "#{dev.bank_loaned_from.upcase}:"
      affected_bank = banks[dev.bank_loaned_from]
      affected_bank.losses += dev.loans
      loan_surplus = affected_bank.make_solvent
      if !(affected_bank.solvent)
        Bank.move_loans_to_nama(affected_bank, loan_surplus, banks['nama'])
      end
      puts ''
    else
      puts "#{dev.name} is not bankrupt (yet)."
    end
  end
end

bank_details = CSV.read('file4.csv')
banks = Bank.create_bank(%w(aib anglo boi rbs ulster nama), bank_details)

dev_details = CSV.read('file5.csv')
developers = Developer.create_developer(dev_details)

puts 'Bank profile (prior to bankruptcy)'
puts ''

banks.collect do |name, profile|
  puts name.upcase
  puts profile
end

puts ''
puts '***'
puts ''

puts 'Developers (prior to bankruptcy)'
puts ''

developers.each { |dev| puts dev }

puts ''
puts '***'
puts ''

puts 'Some developers will now be declared bankrupt!'
puts ''

declared_bankrupt(banks, developers)

puts ''
puts '***'
puts ''

puts 'Bank profile (after bankruptcy)'
puts ''

banks.collect do |bank_name, bank_details|
  puts bank_name.upcase
  puts bank_details
end
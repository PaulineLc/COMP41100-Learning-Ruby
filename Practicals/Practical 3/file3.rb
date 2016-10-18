require 'csv'
require_relative 'file1'

bank_details = CSV.read('file4.csv')

banks = Bank.create_bank(%w(aib anglo boi rbs ulster nama), bank_details)

puts banks[0]
banks[0].losses += 2
solvency = banks[0].make_solvent
puts banks[0]
Bank.move_loans_to_nama(banks[0], solvency, banks[-1])
puts banks[0]
# banks.each{|i| i.make_solvent}

require 'csv'
require_relative 'file1'

bank_names = ["aib", "anglo", "boi", "rbs", "ulster", "nama"]

bank_details = CSV.read('file4.csv')

banks = Bank.create_bank(bank_names, bank_details)

# banks.each{|i| puts i}
# Bank.move_loans_to_nama(banks[0], 30, banks[-1])
# banks.each{|i| puts i}

banks.each{|i| puts i.solvent?}
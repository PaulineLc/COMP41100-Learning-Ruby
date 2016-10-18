require 'csv'
require_relative 'file1'

bank_names = ["aib", "anglo", "boi", "rbs", "ulster", "nama"]

bank_details = CSV.read('file4.csv')

banks = Bank.create_bank(bank_names, bank_details)



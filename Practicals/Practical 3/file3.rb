require 'csv'
require_relative 'file1'
require_relative 'file2'

bank_details = CSV.read('file4.csv')
banks = Bank.create_bank(%w(aib anglo boi rbs ulster nama), bank_details)

dev_details = CSV.read('file5.csv')
developers = Developer.create_developer(dev_details)


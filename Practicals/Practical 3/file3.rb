require 'csv'
require_relative 'file1'

bank_details = CSV.read('file4.csv')

banks = Bank.create_bank(%w(aib anglo boi rbs ulster nama), bank_details)


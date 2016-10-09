require_relative 'bank'
require_relative 'developer'

# Declare banks

aib = Bank.new('AIB', 10000, 15, 1, 0.5)
anglo = Bank.new('Anglo', 8000, 10, 35, 5)
boi = Bank.new('Bank of Ireland', 11000, 13, 40, 1)
rbs = Bank.new('RBS', 92000, 45, 90, 10)
ulster = Bank.new('Ulster Bank', 3500, 5, 40, 0)
nama = Bank.new('NAMA', 200, 240)

all_banks = [aib, anglo, boi, rbs, ulster, nama]

# Declare developers

johnny = Developer.new("Johnny", 35, 90, ulster)
ronan = Developer.new("Ronan", 30, 30, anglo)
murtagh = Developer.new("Murtagh", 45, 40, boi)
lowry = Developer.new("Lowry", 20, 30, rbs)
saoirse = Developer.new("Saoirse", 60, 200, aib)

all_dev = [johnny, ronan, murtagh, lowry, saoirse]


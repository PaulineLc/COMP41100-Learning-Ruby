require_relative 'bank'
require_relative 'developer'

# Declare banks

nama = Bank.new('Nama', 200, 240, 0, 0, nama)
aib = Bank.new('AIB', 10000, 15, 1, 0.5, nama)
anglo = Bank.new('Anglo', 8000, 10, 25, 5, nama)
boi = Bank.new('Bank of Ireland', 11000, 13, 40, 1, nama)
rbs = Bank.new('RBS', 92000, 45, 50, 10, nama)
ulster = Bank.new('Ulster Bank', 3500, 10, 15, 0, nama)

all_banks = [aib, anglo, boi, rbs, ulster, nama]

puts "First, let's have a look at all the banks..."
puts "\n"

all_banks.each do |bank|
  puts bank
  puts "\n"
end

# Declare developers

johnny = Developer.new("Johnny", 35, 90, ulster)
ronan = Developer.new("Ronan", 30, 25, anglo)
murtagh = Developer.new("Murtagh", 45, 40, boi)
lowry = Developer.new("Lowry", 20, 25, rbs)
saoirse = Developer.new("Saoirse", 60, 65, aib)

all_dev = [johnny, ronan, murtagh, lowry, saoirse]

puts "\n"
puts 'Now, let\'s have a look at the developers...'
puts "\n"

all_dev.each do |dev|
  puts dev
  puts "\n"
end

puts "\n"
puts 'Now, let\'s declare those developers bankrupt and see how it goes...'
puts "\n"

all_dev.each{|dev| dev.make_loans_void}

puts "\n"
puts 'And now let\'s have a look at the bad banks again...'
puts "\n"

all_banks.each do |bank|
  puts bank
  puts "\n"
end
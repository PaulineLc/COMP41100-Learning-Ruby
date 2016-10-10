require_relative 'bank'
require_relative 'developer'

# Declare banks

nama = Bank.new('Nama', 200, 240, 0, 0, nama)
aib = Bank.new('AIB', 10000, 15, 0, 80, nama)
anglo = Bank.new('Anglo', 8000, 7, 3, 20, nama)
boi = Bank.new('Bank of Ireland', 11000, 15, 4, 55, nama)
rbs = Bank.new('RBS', 92000, 45, 0, 50, nama)
ulster = Bank.new('Ulster Bank', 3500, 10, 2, 47, nama)

all_banks = [aib, anglo, boi, rbs, ulster, nama]

puts "First, let's have a look at all the banks..."
puts "\n"

all_banks.each do |bank|
  puts bank
  puts "\n"
end

# Declare developers

saoirse = Developer.new("Saoirse", 1, 2, aib)
ronan = Developer.new("Ronan", 2, 3, anglo)
murtagh = Developer.new("Murtagh", 5, 7, boi)
lowry = Developer.new("Lowry", 20, 25, rbs)
johnny = Developer.new("Johnny", 11, 10, ulster)

all_dev = [saoirse, ronan, murtagh, lowry, johnny]

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
puts 'And now let\'s have a look at the banks again...'
puts "\n"

all_banks.each do |bank|
  puts bank
  puts "\n"
end
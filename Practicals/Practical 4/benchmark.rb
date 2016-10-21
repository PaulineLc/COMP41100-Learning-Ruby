require 'set'

# In that file I am testing several methods to check how to improve the method clean_up from utilities.rb (question 4)
# I have created a function to time the execution of each solutions
# Then I just pick the best one :)

# I conducted the test from my terminal with all other programs closed for better accuracy
# But of course some of these results may be attributed to luck (or lack thereof)
# Each method is execute 100,000 times and averaged

# My timer function (a block)
def time_it(n=100000)
  time_taken = 0
  n.times do
    start = Time.now
    yield
    finish = Time.now
    time_taken += finish - start
  end
  time_taken / n
end

# Sample array. The goal is to obtain this array: ['something', 'else']
my_array = ['something', 'something else']

# method one
puts time_it { my_array.join(' ').split(' ').uniq }

# Sample result: 2.7457237900000385e-06
# That's the result we have to beat!

# method two
puts time_it { my_array.map { |elem| elem.split }.flatten.uniq }

# Sample result: 3.4034997700000435e-06
# I am getting inconsistent results with these methods!
# Sometimes method one is better and sometimes method 2 is better
# More often than not, method 1 performs better
# Unfortunately I don't think method two is going to make it through this contest :sadness:

# method 3

puts time_it {
  my_set = Set.new
  my_array.each do |elem|
    elem.split.each { |new_elem| my_set.add(new_elem) }
  end }

# Sample result: 2.9146282499999375e-06
# Better than method 2 and very close in execution time to method 1
# Still not even better than method 1

# method 4
puts time_it {
  my_array.flat_map { |elem| elem.split }.uniq
}

# Sample result: 2.5799204899998294e-06
# Woohoo! That's much better!

#method 5
puts time_it {
  my_set = Set.new
  my_array.each do |elem|
    my_set.merge(elem.split)
  end
}

# Sample result: 4.941351020000006e-06
# I made a huge mistake :x
# This is the worst method ever!

# method 6
puts time_it {
  my_array.inject(Set.new){|my_set, element| my_set.add(element)}.to_a
}

# Sample result: 2.4838566300000297e-06
# That's the best one I could come up with :)

# That's all for now! I can't think of any solution that would be drastically different from the above
# Method 6 has been my best, so I will change clean_up with that.

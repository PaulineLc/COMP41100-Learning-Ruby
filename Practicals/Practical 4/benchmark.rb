require 'set'

# In that file I am testing several methods to check how to improve the method clean_up from utilities.rb (question 4)
# I have created a function to time the execution of each solutions
# Then I just pick the best one :)

# My timer function (a block)
def time_it(n=1000)
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

# Sample result: 3.824058000000003e-06

# method two
puts time_it { my_array.map { |elem| elem.split }.flatten.uniq }

# Sample result: 3.497919000000001e-06
# I am getting inconsistent results with these methods! Sometimes method one is better and sometimes method 2 is better

# method 3

puts time_it {
  my_set = Set.new
  my_array.each do |elem|
    elem.split.each { |new_elem| my_set.add(new_elem) }
  end }

# Sample result: 3.1416570000000023e-06
# Better than method 2 and very close in execution time to method 1

# method 4
puts time_it {
  my_array.flat_map { |elem| elem.split }.uniq
}

# Sample result: 2.6586020000000037e-06
# Woohoo! So much better!

#method 5
puts time_it {
  my_set = Set.new
  my_array.each do |elem|
    my_set.merge(elem.split)
  end
}

# Sample result: 5.212304999999992e-06
# I made a huge mistake :x

# That's all for now! I can't think of any solution that would be drastically different from the above
# Method 4 has been my best, so I will change clean_up with that.
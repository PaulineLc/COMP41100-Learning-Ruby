class Cat
  attr_accessor :name, :hungriness, :sleepiness

  def initialize(name)
    @name = name
    @hungriness = 0
    @sleepiness = 0
  end

  def meow
    no = 1 + rand(10)
    no.times { print 'Meow! ' } #cat says 'meow'
    puts ''

    @hungriness += no #makes cat hungrier
    @sleepiness += (no/2) #makes cat sleepier

    if @hungriness > 0
      #if cat is hungry, makes it eat
      puts "#{@name} is hungry... Going to eat"
      eat
    end
    if @sleepiness > 0
      #if cat is sleepy, makes it sleep
      puts "#{@name} is sleepy... Going to bed"
      sleep
    end
  end

  def eat
    nb_biscuits = 1 + rand(10) #gives biscuit to cat
    print "#{@name}: Om "
    nb_biscuits.times {print 'nom '} #cat eats the biscuit...
    puts ''
    @hungriness -= nb_biscuits #Cat is less hungry
    @hungriness #return hungriness
  end

  def sleep
    nb_hours = 1 + rand(10) #set up the number of hours during which the cat will sleep
    print "#{@name}: "
    nb_hours.times { print 'Zzz... '} #cat sleeps....
    puts ''
    @sleepiness -= nb_hours #cat is less sleepy
    @sleepiness #returns sleepiness
  end

  def sleepier_than(other_cat)
    self.sleep > other_cat.sleep #true if the cat is more sleepy than the other cat
  end

  def hungrier_than(other_cat)
    self.eat > other_cat.eat #true if the cat is more hungry than the other cat
  end

  public :meow, :sleepier_than, :hungrier_than
  protected :sleep
  private :eat

end

puts 'Creating a kitty called Zoe'
my_cat = Cat.new('Zoe')
my_cat.meow

puts ''
puts '********'
puts ''

puts 'Creating a kitty called Zelda'
my_other_cat = Cat.new('Zelda')
my_other_cat.meow

puts ''
puts '********'
puts ''

puts 'Is Zoe sleepiest than Zelda?'
puts my_cat.sleepier_than(my_other_cat)

puts ''
puts '********'
puts ''

puts 'The following method call will fail'
puts 'Is Zoe hungrier than Zelda?'
puts my_cat.hungrier_than(my_other_cat)
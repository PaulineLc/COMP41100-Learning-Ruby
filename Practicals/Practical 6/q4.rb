class Cat
  attr_accessor :name, :hungriness, :sleepiness

  def initialize(name)
    @name = name
    @hungriness = 0
    @sleepiness = 0
  end

  def meow
    no = 1 + rand(10)
    no.times { print 'Meow! ' }
    puts ''
    @hungriness += no
    @sleepiness += (no/2)
    if @hungriness > 0
      puts "#{@name} is hungry... Going to eat"
      eat
    end
    if @sleepiness > 0
      puts "#{@name} is sleepy... Going to bed"
      sleep
    end
  end

  def eat
    nb_biscuits = 1 + rand(10)
    print "#{@name}: Om "
    nb_biscuits.times {print 'nom '}
    puts ''
    @hungriness -= nb_biscuits
  end

  def sleep
    nb_hours = 1 + rand(10)
    print "#{@name}: "
    nb_hours.times { print 'Zzz... '}
    puts ''
    @sleepiness -= nb_hours
    @sleepiness
  end

  def sleepier_than(other_cat)
    self.sleep > other_cat.sleep
  end

  def hungrier_than(other_cat)
    self.eat > other_cat.eat
  end

  public :meow
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
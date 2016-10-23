class Felidae < Animal

  attr_accessor :color, :biomes

  def initialize(scientific_name, lethal, social, regions, domesticated, extinct, color, biomes)
    super(scientific_name, true, true, lethal, social, regions, domesticated, extinct)
    @color = color
    @biomes = biomes
  end

  def where_does_it_live
    puts "#{scientific_name}: this felidae can be observed in its natural evironment in the following regions:"
    @regions.each{|region| puts "\t-#{region}"}

    puts 'They tend to live in the following places:'
    @biomes.each{|biome| puts "\t-#{biome}"}
  end

  def describe
    print "This #{scientific_name} is #{@color} of color and "
    if social
      then print 'lives with other members of its species. '
    else print 'lives alone. '
    end
    if lethal
      print 'It could kill you.'
    else print 'It cannot kill you.'
    end
    puts ''
  end

end
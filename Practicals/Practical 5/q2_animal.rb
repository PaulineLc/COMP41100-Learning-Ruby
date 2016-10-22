class Animal

  attr_accessor :scientific_name, :vertebrate, :carnivorous, :lethal, :social, :regions, :domesticated, :extinct

  def initialize(scientific_name, vertebrate, carnivorous, lethal, social, regions, domesticated, extinct)
    @scientific_name = scientific_name
    @vertebrate = vertebrate
    @carnivorous = carnivorous
    @lethal = lethal
    @social = social
    @regions = regions
    @domesticated = domesticated
    @extinct = extinct
  end

  def friendly?
    @domesticated && !@lethal
  end

  def lives_in_colonies
    if @social && @extinct
      puts "#{scientific_name}: this animal was living in colonies a long time ago"
    elsif @social && !@extinct
      puts "#{scientific_name}: this animal usually lives in colonies"
    else puts "#{scientific_name}: It is unlikely to find a colony of that animal"
    end
  end

  def found_in?(place)
    @regions.include?(place)
  end

  def where_does_it_live
    "#{scientific_name}: this animal can be observed in its natural evironment in:"
    @regions.each{|region| puts "\t-#{region}"}
  end

  def what_does_it_eat
    if @carnivorous
      puts "#{scientific_name}: this animal needs meat to survive."
    else puts "#{scientific_name}: this animal is vegetarian"
    end
  end

  def found_everywhere?
    @regions.length == 5
  end

end
require_relative 'q2_animal'
require_relative 'q2_felidae'
require_relative 'q2_cat'

zoe = Cat.new('Zoe', 'black', 'Lallinec')

puts 'I created a cat named Zoe'
puts ''

puts 'Now calling methods from the superclass\' superclass'
puts ''

puts 'What kind of thing is Zoe?'
puts "#{zoe.name} is a #{zoe.scientific_name}"
puts ''

puts 'Is Zoe friendly?'
puts zoe.friendly?
puts ''

puts 'Could Zoe live with other cats (in colonies)?'
zoe.lives_in_colonies
puts ''

puts 'Could Zoe be in Europe?'
puts zoe.found_in?('Europe')
puts ''

puts 'Can Zoe be found everywhere?'
puts zoe.found_everywhere?
puts ''

puts 'What does Zoe eat?'
zoe.what_does_it_eat
puts ''

puts 'Now calling a superclass method'
puts ''

puts 'Can you describe Zoé?'
zoe.describe
puts ''

puts 'Now calling a specialized method (an override of the superclass method) from the superclass'
puts ''

puts 'Where could Zoé live?'
zoe.where_does_it_live
puts ''

puts 'Now calling methods from the class'
puts ''

puts 'Is zoe up for adoption?'
puts zoe.for_adoption?
puts ''

puts 'What sound does Zoe make?'
zoe.make_a_sound
class FamilyMember
  attr_accessor :name, :sex, :status, :age, :children

  def initialize(name, sex, status, age, children)
    @name = name
    @sex = sex
    @status = status
    @age = age
    @children = children
  end

  def parent?
    if (@status.eql?('mother') || @status.eql?('father')) && @children != []
      then puts @name + ' is a ' + @status
    end
    (@status.eql?('mother') || @status.eql?('father')) && @children != []
  end

  def children?
    if @age < 18 && (@status.eql?('daughter') || @status.eql?('son'))
      then puts @name + ' is a ' + @status
    end
    @age < 18 && (@status.eql?('daughter') || @status.eql?('son'))
  end

end

fm1 = FamilyMember.new('Nana', 'F', 'mother', 53, ['Zaza', 'Toto'])
fm2 = FamilyMember.new('Jojo', 'M', 'father', 60, ['Zaza', 'Toto'])
fm3 = FamilyMember.new('Zaza', 'F', 'daughter', 18, [])
fm4 = FamilyMember.new('Toto', 'M', 'son', 12, [])
fm5 = FamilyMember.new('Bob', 'M', 'dog', 6, [])

puts 'Is %s a parent?' % [fm1.name]
puts fm1.parent?
puts 'Is %s a parent?' % [fm2.name]
puts fm2.parent?
puts 'Is %s a parent?' % [fm3.name]
puts fm3.parent?
puts 'Is %s a parent?' % [fm4.name]
puts fm4.parent?
puts 'Is %s a parent?' % [fm5.name]
puts fm5.parent?
puts 'Is %s a child?' % [fm1.name]
puts fm1.children?
puts 'Is %s a child?' % [fm2.name]
puts fm2.children?
puts 'Is %s a child?' % [fm3.name]
puts fm3.children?
puts 'Is %s a child?' % [fm4.name]
puts fm4.children?
puts 'Is %s a child?' % [fm5.name]
puts fm5.children?

puts "\n"

fm_array = [fm1, fm2, fm3, fm4, fm5]
fm_array.each { |i| puts 'name: ' + i.name + '; status: ' + i.status }

puts "\n"

fm_array.each do |fam_member|
  puts 'name:', fam_member.name
  puts 'status:', fam_member.status
  puts "\n"
end


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
      (@status.eql?("mother") || @status.eql?("father")) && @children != []
    end

    def children?
      @age < 18 && (@status.eql?("daughter") || @status.eql?("son"))
    end

end

fm1 = FamilyMember.new("Nana", "F", "mother", 53, ["Zaza", "Toto"])
fm2 = FamilyMember.new("Jojo", "M", "father", 60, ["Zaza", "Toto"])
fm3 = FamilyMember.new("Zaza", "F", "daughter", 18, [])
fm4 = FamilyMember.new("Toto", "M", "son", 12, [])
fm5 = FamilyMember.new("Bob", "M", "dog", 6, [])

puts "Is %s a parent? %s" % [fm1.name, fm1.parent?]
puts "Is %s a parent? %s" % [fm2.name, fm2.parent?]
puts "Is %s a parent? %s" % [fm3.name, fm3.parent?]
puts "Is %s a parent? %s" % [fm4.name, fm4.parent?]
puts "Is %s a parent? %s" % [fm5.name, fm5.parent?]
puts "Is %s a child? %s" % [fm1.name, fm1.children?]
puts "Is %s a child? %s" % [fm2.name, fm2.children?]
puts "Is %s a child? %s" % [fm3.name, fm3.children?]
puts "Is %s a child? %s" % [fm4.name, fm4.children?]
puts "Is %s a child? %s" % [fm5.name, fm5.children?]

puts "\n"

fm_array = [fm1, fm2, fm3, fm4, fm5]
fm_array.each { |i| puts "name: " + i.name + "; status: " + i.status }

puts "\n"

fm_array.each do |fam_member|
   puts "name:", fam_member.name
   puts "status:", fam_member.status
   puts "\n"
  end


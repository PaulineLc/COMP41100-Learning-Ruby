require_relative 'q1_isgoodkitty'
require_relative 'q1_checkoutthekitty'

def create_cat(cat_name = "")
  if cat_name.eql?("")
    then puts "What's your kitty's name?"
    cat_name = gets.chomp
  end
  checkout_kitty(cat_name)
end

def play
  puts "I have a cat! Her name is Kitten Zozo. I will ask my Computer Guru if they like it that way"
  puts "Hey, Computer Guru, do you like my cat?"
  puts "\n"
  puts "Guru: Umm let me see the kitty... Here is what I think about this kitty:"
  puts "Guru: " + checkout_kitty("Kitten Zozo")
  puts "\n"
  puts "You! Reading that screen! Do you have a kitty?"
  puts "(Note: enter 'Y' for yes, 'N' for no, and enter anything else -even nothing- to play with the sample input 'Kittee McKittenface')"
  answer = gets.chomp
  puts "\n"
  if answer.casecmp("Y") == 0
    then puts create_cat
  elsif answer.casecmp("N") == 0
    then puts "Oh, that's so sad :-("
  else puts create_cat("Kittee McKittenface")
  end
end

play

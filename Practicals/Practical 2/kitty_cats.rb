require_relative 'cat_check'
require_relative 'cat_assessment'

def create_cat
 puts "What's your kitty's name?"
 kitty_name = gets.chomp
 checkout_kitty(kitty_name)
end


p "I have a cat! Her name is Kitten Zozo. I will ask my computer Guru if they like it that way"
p "Hey, computer Guru, do you like my cat?"
p "Guru: Umm let me see the kitty... Here is what I think about this kitty:"
p checkout_kitty("Kitten Zozo")

p "You! Reading that screen! Do you have a kitty? (Y/N)"
answer = gets.chomp
if answer == "Y"
 then create_cat
else p "Oh, that's so sad :-("
end

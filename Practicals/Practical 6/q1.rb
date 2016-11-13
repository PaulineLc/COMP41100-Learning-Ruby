require 'csv'

class SpamChecker

  attr_accessor :email_text, :spam_score

  @@spam_key_words = []

  def initialize(email_text)
    @email_text = email_text.downcase
    @spam_score = 0
  end

  def run_analysis
    check_content
    spam_probability = get_spam_probability
    print  "This email has a spam score of #{spam_probability * 10}/10 and therefore, "
    if spam_probability >= 0.5
      print 'it is classified as spam'
    else print 'it is not classified as spam'
    end

    puts ''

  end

  def check_content
    @@spam_key_words.each do |spam|
      if @email_text =~ spam # check for match
        @spam_score += 1
      end
    end
  end

  def get_spam_probability
    lower_bound = 4 #my non-spam emails have an average @spam_score of 4 so I picked 4 as lower bound
    upper_bound = 12 #my non-spam emails have an average @spam_score of 12.4 so I picked 12 as upper_bound

    if @spam_score <= 4
      probability = 0 #definitely not spam

    elsif @spam_score >= 12
      probability = 1 #definitely spam

    else probability = (@spam_score - 4) / (12 - 4).to_f #calculating "closeness" to upper and lower bound e.g. a spam score of 8 would have a probability of 0.5
    end

    probability # value to return

  end

  def self.compute_spam_key_words(path)
    CSV.foreach(path) do |keyword|
      @@spam_key_words << /#{Regexp.quote(keyword[0].downcase)}/ # add the spam-y word/sentence as a lowercase RegExp
    end
  end

  def self.spam_key_words
    @@spam_key_words
  end

  public :run_analysis
  private :check_content, :get_spam_probability

end

#List taken from http://www.mailup.com/resources-mailup/strategy/strategies-techniques-and-best-practices/spam-words-to-avoid/
#Define the list of spam keywords
SpamChecker.compute_spam_key_words('spam_words.csv')

puts 'Spam #1'
scam1 = SpamChecker.new(File.read('scam1.txt'))
scam1.run_analysis
puts ''

puts 'Spam #2'
scam2 = SpamChecker.new(File.read('scam2.txt'))
scam2.run_analysis
puts ''

puts 'Spam #3'
scam3 = SpamChecker.new(File.read('scam3.txt'))
scam3.run_analysis
puts ''

puts 'Spam #4'
scam4 = SpamChecker.new(File.read('scam4.txt'))
scam4.run_analysis
puts ''

puts 'Spam #5'
scam5 = SpamChecker.new(File.read('scam5.txt'))
scam5.run_analysis
puts ''

puts 'Normal email 1'
normal1 = SpamChecker.new(File.read('normal1.txt'))
normal1.run_analysis
puts ''

puts 'Normal email 2'
normal2 = SpamChecker.new(File.read('normal2.txt'))
normal2.run_analysis
puts ''

puts 'Normal email 3'
normal3 = SpamChecker.new(File.read('normal3.txt'))
normal3.run_analysis
puts ''

puts 'Normal email 4'
normal4 = SpamChecker.new(File.read('normal4.txt'))
normal4.run_analysis
puts ''

puts 'Normal email 5'
normal5 = SpamChecker.new(File.read('normal5.txt'))
normal5.run_analysis
puts ''
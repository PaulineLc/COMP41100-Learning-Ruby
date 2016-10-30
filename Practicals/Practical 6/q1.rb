require 'csv'

class SpamChecker

  attr_accessor :email_text, :spam_score

  # public :run_analysis
  # private :tokenize, :check_content, :spam_score, :classified_spam?

  @@spam_key_words = []

  def initialize(email_text)
    @email_text = email_text
    @spam_score = 0
  end

  def run_analysis
    check_content
    print  "This email has a spam score of #{@spam_score} and therefore, "
    if classified_spam?
      print 'it is classified as spam'
      else print 'it is not classified as spam'
    end

    puts ''

  end

  def tokenize
    @email_text.split
  end

  def check_content
    tokenize.each do |word|
      @@spam_key_words.each do |spam|
        if word =~ spam
          @spam_score += 1
        end
      end
    end
  end

  def classified_spam?
    spam_score >= 2
  end

  def self.compute_spam_key_words(path)
    CSV.foreach(path) do |keyword|
      @@spam_key_words << /#{Regexp.quote(keyword[0])}/
    end
  end

  def self.spam_key_words
    @@spam_key_words
  end

end

#List taken from http://www.mailup.com/resources-mailup/strategy/strategies-techniques-and-best-practices/spam-words-to-avoid/

#Define the list of spam keywords
SpamChecker.compute_spam_key_words('spam_words.csv')

scam1 = SpamChecker.new(File.read('scam3.txt'))
scam1.run_analysis
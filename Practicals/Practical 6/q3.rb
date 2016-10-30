#http://www.kittenwar.com/

require 'nokogiri'
require 'open-uri'
require 'pp'

doc = Nokogiri::HTML(open('http://www.kittenwar.com/'))

pp doc
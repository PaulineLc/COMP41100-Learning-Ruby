require 'nokogiri'
require 'open-uri'
require 'pp'

#How I got there:
#Google 'arbitrary selected page from somewhere'
#That was the first result...

doc = Nokogiri::HTML(open('https://stackoverflow.com/questions/16570959/find-an-img-tag-somewhere-under-a-specific-div-using-xpath'))
p_elements = doc.xpath('/html/body//p')
images = doc.xpath('//img')
td_elements = doc.xpath('//td')

sth = doc.xpath('//a[@href]')

puts sth

#idea : find all text, find most common words and return it to provide potential keywords for the topic
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

links = doc.xpath('//a[@href]')

puts 'all p elements:'
puts p_elements
puts ''

puts 'link to images'
puts images
puts ''

puts 'td elements'
puts td_elements
puts ''

puts 'Hyperlinks:'
puts links
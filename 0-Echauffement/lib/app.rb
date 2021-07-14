require 'dotenv'
require 'rubocop'
require 'pry'
require 'rspec'
require 'nokogiri'
require 'rubygems'
require 'open-uri'


# page = Nokogiri::HTML(open("https://fr.wikipedia.org/wiki/Ruby"))   
# puts "---"
# puts puts page.class   # => Nokogiri::HTML::Document

# links = page.css("a")
# # puts links.length  
# # puts links[3].text  
# # puts links[3]["href"] 

# links.each do |link|
#   puts link['href']
# end


# //*[@id="rso"]


doc = Nokogiri::HTML(open("http://www.google.com/search?q=doughnuts"))
doc.xpath('//a/h3').each do |node|
  puts node
end




require 'dotenv'
require 'rubocop'
require 'pry'
require 'rspec'
require 'nokogiri'
require 'rubygems'
require 'open-uri'


doc = Nokogiri::HTML(open(""))


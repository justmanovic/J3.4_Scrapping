require_relative '../lib/01_scrapper_f'

require 'dotenv'
require 'rubocop'
require 'pry'
require 'rspec'
require 'nokogiri'
require 'rubygems'
require 'open-uri'
# require 'rspec/autorun'

describe 'la fonction lecture_page' do

  it 'scrape le nom des cryptos et la valeur correspondante sur la page coinmarketcap. renvoie une liste de hashes' do
    expect(check("BTC")).to eq("BTC") 
  end
end
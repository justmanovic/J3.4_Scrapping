require 'dotenv'
require 'rubocop'
require 'pry'
require 'rspec'
require 'nokogiri'
require 'rubygems'
require 'open-uri'


doc = Nokogiri::HTML(open("https://coinmarketcap.com/all/views/all/"))

tab_crypto_name = []
tab_crypto_values = []


doc.xpath("//tr/td[3]/div").each do |crypto|
  tab_crypto_name << crypto.text
end

doc.xpath("//tr/td[5]/div/a").each do |crypto|
  tab_crypto_values << crypto.text
end

# hash = Hash[tab_crypto_name.zip(tab_crypto_values)]

# print hash


# puts list_coin

# def get_name_value

# end

# //*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[3]/div
# //*[@id="__next"]/div[1]/div[2]/div/div[1]/div/div[2]/div[3]/div/table/tbody/tr[1]/td[5]/div/a
# def

  # cmc-table-row

  # 

  # cmc-table__cell cmc-table__cell--sortable cmc-table__cell--right cmc-table__cell--sort-by__price
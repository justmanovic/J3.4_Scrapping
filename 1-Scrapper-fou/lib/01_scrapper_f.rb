require 'dotenv'
require 'rubocop'
require 'pry'
require 'rspec'
require 'nokogiri'
require 'rubygems'
require 'open-uri'

def lecture_page (page)
  # Initialisation
  doc = Nokogiri::HTML(open(page))
  tab_crypto_name = []
  tab_crypto_values = []

  # On ajoute au tableau tab_crypto_name les noms de cryptos scrappées
  doc.xpath("//tr/td[3]/div").each  { |crypto| tab_crypto_name << crypto.text }

  # puts tab_crypto_name

  # On ajoute au tableau tab_crypto_values les valeurs de cryptos scrappées
  doc.xpath("//tr/td[5]/div/a").each  { |crypto| tab_crypto_values << crypto.text }
  
  # puts tab_crypto_values

  # Constitution d'un tableau de hash à partir d'un tableau de tableaux, sans oublier la suppression des virgules pour conversion nombre
  tab_page = tab_crypto_name.zip(tab_crypto_values).map { |x,y| { x=>y.delete('$,').to_f } }
  return tab_page
end

# Fonction dédiée au test : elle renvoit le string correspondant à la crypto cherchée si présente dans le tableau final
def check(crypto_string)
  result = lecture_page("https://coinmarketcap.com/all/views/all/").select{|h| h.has_key?(crypto_string)}[0].keys[0]
  puts result.class
  return result
end

# puts check("BTC")


# puts lecture_page ("https://coinmarketcap.com/all/views/all/").select{|h| h.has_key?("BTC")}[0].keys[0]


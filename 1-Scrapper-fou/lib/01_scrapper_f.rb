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
  doc.xpath("//tr/td[3]/div/a/div/div/div/p").each  { |crypto| tab_crypto_name << crypto.text }  

  # On ajoute au tableau tab_crypto_values les valeurs de cryptos scrappées
  doc.xpath("//tr/td[4]/div/a").each  { |crypto| tab_crypto_values << crypto.text }
  
  # Constitution d'un tableau de hash à partir d'un tableau de tableaux, sans oublier la suppression des virgules pour conversion nombre
  tab_page = tab_crypto_name.zip(tab_crypto_values).map { |x,y| { x=>y.delete('$,').to_f } }
end




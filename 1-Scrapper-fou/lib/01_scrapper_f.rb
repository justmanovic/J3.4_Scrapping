require 'dotenv'
require 'rubocop'
require 'pry'
require 'rspec'
require 'nokogiri'
require 'open-uri'

def lecture_page(page)
  # Initialisation
  doc = Nokogiri::HTML(URI.open(page))
  tab_crypto_name = []
  tab_crypto_values = []

  # On ajoute au tableau tab_crypto_name les noms de cryptos scrappées
  doc.xpath("//tr/td[3]/div").each { |crypto| tab_crypto_name << crypto.text }

  # On ajoute au tableau tab_crypto_values les valeurs de cryptos scrappées
  doc.xpath("//tr/td[5]/div/a").each { |crypto| tab_crypto_values << crypto.text }

  # Constitution d'un tableau de hash à partir d'un tableau de tableaux, sans oublier la suppression des virgules pour conversion nombre
  tab_page = tab_crypto_name.zip(tab_crypto_values).map { |x,y| { x=>y.delete('$,').to_f } }

  return tab_page
end

# Fonction dédiée au test : elle renvoit le string correspondant à la crypto cherchée si présente dans le tableau final
def check(crypto_string)
  
  # récupère la liste des hashes et renvoie la valeur crypto_string si elle est contenue dans un des hashs
  return lecture_page("https://coinmarketcap.com/all/views/all/").select{|h| h.has_key?(crypto_string)}[0].keys[0]
end
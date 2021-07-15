require 'dotenv'
require 'rubocop'
require 'pry'
require 'rspec'
require 'nokogiri'
require 'rubygems'
require 'open-uri'

# Renvoi un hash par député avec son nom, prénom et email à partir de sa fiche
def get_depute_email(liste_depute_url)
  doc = Nokogiri::HTML(open(townhall_url))
  complete_name = doc.xpath("//*[@id='haut-contenu-page']/article/div[2]/h1").text
  email = doc.xpath("//*[@id='haut-contenu-page']/article/div[3]/div/dl/dd/ul/li[2]/a").text
  first_name = complete_name.split(" ")[1]
  last_name = (complete_name.split - ["M.", "Mme", complete_name.split(" ")[1]]).join(" ")
  h = {"first_name"=>first_name, "last_name"=>last_name, "email"=>email}
  return h
end

# Tableau des URLs des fiches à partir de la liste des députés
def get_deputes_urls(page_liste)
  doc = Nokogiri::HTML(open(page_liste))
  tab_url = []
  
  # Récupération des URLs des fiches de chaque député et ajout du début de l'URL
  doc.xpath("//ul/li/a[contains(@href, 'fiche')]/@href").each { |url| tab_url<< ("https://www2.assemblee-nationale.fr" + url.to_s) }
  
  return tab_url
end

# Obtention des emails des députés à partir de la liste des députés
def get_all_emails(page_dept)
  list_emails = []
  list_pages =  get_deputes_urls(page_dept)

  # Constitution du tableau final des hash
  list_pages.each { |url| list_emails << get_depute_email(url) }

  return list_emails
end
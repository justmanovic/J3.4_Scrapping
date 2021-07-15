require 'dotenv'
require 'rubocop'
require 'pry'
require 'rspec'
require 'nokogiri'
require 'rubygems'
require 'open-uri'

# # Fonction qui génère un hash constitué du nom de la commune et de son adresse email à partir de l'URL de la commune
# def get_townhall_email(townhall_url)
#   doc = Nokogiri::HTML(open(townhall_url))
#   email_h = {(doc.xpath("//div/div[1]/h1/small").text.split - ["Commune", "de"]).join=>doc.xpath("//section[2]/div/table/tbody/tr[4]/td[2]").text}
# end

# # Récupération des URL des communes dans un tableau à partir de la liste des communes du département
# def get_townhall_urls(page_liste)
#   doc = Nokogiri::HTML(open(page_liste))
#   tab_url = []

#   # On trouve toutes les URL des communes, et on les ajoute dans le tableau créé précedemment, et on remplace le "." par le début de l'URL
#   doc.xpath("//p/a/@href").each  {|url| tab_url << url.to_s.sub(/[.]/ , 'http://annuaire-des-mairies.com/')} 

#   return tab_url
# end

# # Combinaison des 2 fonctions : à partir de la page du département, on va récupérer toutes les adresses emails associées
# def get_all_emails(page_dept)
#   list_emails = []

#   # On récupère les URL
#   list_pages =  get_townhall_urls(page_dept)

#   # Constitution du tableau de hash
#   list_pages.each {|url| list_emails << get_townhall_email(url)}
#   return list_emails
# end




def get_city_name
  city_name_tab= []
  page = Nokogiri::HTML(open("http://annuaire-des-mairies.com/val-d-oise.html"))
    page.xpath("//p/a[@class='lientxt']").each { |name| city_name_tab << name.text } 
  return city_name_tab
end

def get_url(city_page)
  url_tab = []
  page = Nokogiri::HTML(open(city_page))
    page.xpath("//p/a/@href").each { |city| url_tab << city.to_s.sub(/[.]/, "https://www.annuaire-des-mairies.com/") }
  return url_tab
end


def get_email(url_city_page)
  page = Nokogiri::HTML(open(url_city_page))
  return page.xpath("/html/body/div/main/section[2]/div/table/tbody/tr[4]/td[2]").text 
end

def perform
  puts get_city_name
  #puts get_url("https://www.annuaire-des-mairies.com/val-d-oise.html%22)
  puts get_email(get_url(city))
end

# perform
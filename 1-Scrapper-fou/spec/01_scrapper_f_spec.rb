require_relative '../lib/01_scrapper_f'

describe 'la fonction lecture_page' do

  it 'scrape le nom des cryptos et la valeur correspondante sur la page coinmarketcap. renvoie une liste de hashes' do
    expect(check("BTC")).to eq("BTC") 
  end

  it 'scrape le nom des cryptos et la valeur correspondante sur la page coinmarketcap. renvoie une liste de hashes' do
    expect(check("ETH")).to eq("ETH") 
  end

  it 'scrape le nom des cryptos et la valeur correspondante sur la page coinmarketcap. renvoie une liste de hashes' do
    expect(check("ADA")).to eq("ADA") 
  end

  it 'scrape le nom des cryptos et la valeur correspondante sur la page coinmarketcap. renvoie une liste de hashes' do
    expect(check("XRP")).to eq("XRP") 
  end

end

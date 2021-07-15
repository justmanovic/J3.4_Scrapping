require_relative '../lib/app'


describe 'la fonction trading' do

  it 'identifie le meilleure couple [J-achat J-vente]' do
    expect(trading([17, 3, 6, 9, 15, 8, 6, 1, 10])).to eq([1,4]) 
  end
  it 'identifie le meilleure couple [J-achat J-vente]' do
    expect(trading([20, 18, 17, 13, 14, 10, 9, 8, 7])).to eq([3,4])  
  end
  it 'identifie le meilleure couple [J-achat J-vente]' do
    expect(trading([11, 15, 4, 12, 16, 17, 20, 15, 10])).to eq([2,6])
  end
  it 'identifie le meilleure couple [J-achat J-vente]' do
    expect(trading([19, 18, 17, 16, 15, 14, 13, 12, 11])).to eq([0,0])
  end
end
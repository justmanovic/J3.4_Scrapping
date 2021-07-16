require_relative '../lib/03_cher_dpy'


describe 'get_depute_email' do

  it 'renvoie un hash avec le prénom, nom et email du député' do
    expect(get_depute_email("https://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA721158")).to eq({"first_name"=>"Pieyre-Alexandre", "name"=>"Anglade", "email"=>"pieyre-alexandre.anglade@assemblee-nationale.fr" }]) 
  end
  # it 'renvoie un hash avec le prénom, nom et email du député' do
  #   expect(trading([20, 18, 17, 13, 14, 10, 9, 8, 7])).to eq([3,4])  
  # end
  # it 'renvoie un hash avec le prénom, nom et email du député' do
  #   expect(trading([11, 15, 4, 12, 16, 17, 20, 15, 10])).to eq([2,6])
  # end
  # it 'renvoie un hash avec le prénom, nom et email du député' do
  #   expect(trading([19, 18, 17, 16, 15, 14, 13, 12, 11])).to eq([0,0])
  # end
end
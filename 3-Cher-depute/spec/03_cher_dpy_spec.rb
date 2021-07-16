require_relative '../lib/03_cher_dpy'


describe 'get_depute_email' do

  it 'renvoie un hash avec le prénom, nom et email du député' do
    expect(get_depute_email("https://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA721158")).to eq({"first_name"=>"Pieyre-Alexandre", "last_name"=>"Anglade", "email"=>"pieyre-alexandre.anglade@assemblee-nationale.fr" }) 
  end
  it 'renvoie un hash avec le prénom, nom et email du député' do
    expect(get_depute_email("https://www2.assemblee-nationale.fr/deputes/fiche/OMC_PA721126")).to eq({"first_name"=>"Claire", "last_name"=>"Guion-Firmin", "email"=>"claire.javois@assemblee-nationale.fr" }) 
  end
end
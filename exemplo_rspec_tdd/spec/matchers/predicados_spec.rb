describe 'Predicados' do
  # E possivel usar qualquer predicado do Ruby
  # Exemplo, substituir 1.odd? por to be_odd
  it 'odd' do
    expect(1).to be_odd
  end
  
  # Exemplo, substituir ''.empty? por to be_empty
  it 'present' do
    expect('str').not_to be_empty
    expect('').to be_empty
  end
end

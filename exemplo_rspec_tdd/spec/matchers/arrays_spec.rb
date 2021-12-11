# Podemos criar tag filters: :collection ou type: 'collection'
# E fazer filtros na hora de executar os testes com
# rspec --tag 'tag' ou rspec -t 'tag'
describe Array.new([1,2,3]), :collection do
  it '#include' do
    expect(subject).to include(2)
    expect(subject).to include(1,2)
  end
  
  # Pode-se adicionar tags a testes especificos.
  # Com 'rspec -t ~[tag]' podemos excluir os testes de uma tag
  # Exemplo 'rspec -t ~slow'
  it '#match_array/#contain_exactly', slow:true do
    expect(subject).to contain_exactly(1,2,3)
    expect(subject).to match_array([1,2,3])
  end
end
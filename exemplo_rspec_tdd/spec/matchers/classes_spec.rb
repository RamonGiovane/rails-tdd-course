require 'string_nao_vazia'

describe 'Comparação de classes' do
  # Compara a instancia
  it 'be_instance_of' do
    expect(10).to be_an_instance_of(Integer)
  end

  # Compara a arvore de heranca
  it 'be_kind_of' do
    str = StringNaoVazia.new
    expect(str).to be_kind_of(StringNaoVazia)
    expect(str).to be_kind_of(String)
  end

  # Sintaxe mais simples
  it 'be_a/be_an' do
    expect(10).to be_an(Integer)
    
    str = StringNaoVazia.new
    expect(str).to be_a(StringNaoVazia)
    expect(str).to be_a(String)
  end

  # Verifica se um possui determinado metodo
  it 'respond_to' do
    expect('ruby').to respond_to(:size)
    expect('ruby').to respond_to(:count)
  end
end
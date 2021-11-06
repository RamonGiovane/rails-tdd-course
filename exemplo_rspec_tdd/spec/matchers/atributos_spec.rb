require 'pessoa'
describe 'Atributos' do
  it 'have_attributes' do
    pessoa = Pessoa.new

    pessoa.nome = 'Ramon'
    pessoa.idade = 22
    expect(pessoa).to have_attributes(nome: 'Ramon', idade: 22)

    pessoa.nome = 'Ramon Dias'

    # Alias para starting_with: a_string_starting_with, start_with
    expect(pessoa).to have_attributes(nome: starting_with('Ramon'), idade: (be >= 20))
  end
end

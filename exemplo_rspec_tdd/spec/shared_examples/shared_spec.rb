require 'pessoa'

RSpec.shared_examples 'status' do |sentimento|
  it sentimento.to_s do
    pessoa.send("#{sentimento}!")
    expect(pessoa.status).to eq("Sentindo-se #{sentimento.capitalize}!")
  end
end

describe 'Pessoa' do
  subject(:pessoa) { Pessoa.new }

  it_behaves_like 'status', :feliz
  it_behaves_like 'status', :triste
  it_behaves_like 'status', :contente

  # Semelhantes:
  # include_examples 'status', :feliz
  # it_should_behave_like 'status', :feliz
end

# Serve para evitar repetições como:
# describe 'Pessoa' do
#   subject(:pessoa) { Pessoa.new }

#   it 'feliz!' do
#     pessoa.feliz!
#     expect(pessoa.status).to contain_exactly('Sentindo-se Feliz!')
#   end

#   it 'triste!' do
#     pessoa.triste!
#     expect(pessoa.status).to contain_exactly('Sentindo-se Triste!')
#   end
# end
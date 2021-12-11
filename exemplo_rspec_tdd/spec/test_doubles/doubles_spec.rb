# "Double" esta para "dublê", no caso, uma classe falsa para simularmos trocas
# de mensagens de objetos nos testes
describe 'Test Double' do
  it '--' do
    user = double('User') # criando um duble!
    # Criando um uma propriedade para a minha classe falsa
    allow(user).to receive(:name).and_return('Ramon')
    # Syntax suggar:
    allow(user).to receive_messages(type: 'admin', password: 'senha')

    puts user.name
    puts user.type
    puts user.password
  end
end

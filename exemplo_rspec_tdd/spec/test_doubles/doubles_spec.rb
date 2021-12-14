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

  it 'as_null_object' do
    user = double('User').as_null_object # quando 
    
    allow(user).to receive(:name).and_return('Ramon')
    allow(user).to receive_messages(type: 'admin', password: 'senha')

    puts user.name
    puts user.type
    puts user.password
   
    # Quando usamos as_null_object, ao testarmos uma referencia nula, nao dispara erro
    puts user.foo
    puts user.non_existing_method
  end

  
end

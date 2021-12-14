require 'student'
require 'course'

# Mocks sao usados para testar comportamentos, enquato que
# Stubs sao usados para subsituir estados
describe 'Mocks' do
  it '#bar' do
    # setup
    student = Student.new

    # verify
    expect(student).to receive(:bar)

    # exercise
    student.bar
  end

  it 'args' do
    student = Student.new
    expect(student).to receive(:foo).with(123)
    student.foo(123)
  end

  it 'retorno' do
    student = Student.new
    expect(student).to receive(:foo).with(123).and_return(true)
    student.foo(123)
  end

  it 'repeticao - duas vezes' do
    student = Student.new
    expect(student).to receive(:foo).with(123).twice
    student.foo(123)
    student.foo(123)
  end

  it 'repeticao - exatamente x vezes' do
    student = Student.new
    expect(student).to receive(:foo).with(123).exactly(2).times

    # outros
    # expect(student).to receive(:foo).with(123).at_least(:once)
    # expect(student).to receive(:foo).with(123).at_least(:twice)
    # expect(student).to receive(:foo).with(123).at_least(n).times

    student.foo(123)
    student.foo(123)
  end

  it 'retorno' do
    student = Student.new
    
    # Diz ao objeto para retornar um valor ao receber a mensagem. 
    # Dado mais de um valor, o primeiro valor eh retornado na primeira vez que a mensagem eh recebida, 
    # o segundo valor eh retornado na próxima vez, etc, etc.
    expect(student).to receive(:foo).with(123).and_return(true)
    student.foo(123)

    expect(student).to receive(:foo).with(123).and_return(false)
    student.foo(123)


    expect(student).to receive(:foo).with(123).and_return(true, false)
    student.foo(123)
    student.foo(123)
  end
end

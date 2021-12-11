require 'student'
require 'course'

describe 'Stub' do
  it '#has_finished?' do
    student = Student.new
    course = Course.new

    # Criando um stub, que forca um resposta especifica de algo
    allow(student).to receive(:has_finished?).with(an_instance_of(Course)).and_return(true)

    # Este metodo nao foi implementado, mas por causa do stub espera-se que retorne true!!
    expect(student.has_finished?(course)).to be true
  end

  it 'Argumentos dinâmicos' do
    student = Student.new

    allow(student).to receive(:foo) do |arg|
      if arg == :hello
        'olá'
      elsif arg == :hi
        'oi'
      else 'nada'
      end
    end

    expect(student.foo(:hello)).to eq('olá')
    expect(student.foo(:hi)).to eq('oi')
    expect(student.foo(:aloha)).to eq('nada')
  end

  it 'Qualquer instância de Classe' do
    s1 = Student.new
    s2 = Student.new

    allow_any_instance_of(Student).to receive(:bar).and_return(true)

    expect(s1.bar).to be true
    expect(s2.bar).to be true
  end


  it 'Erros' do
    s1 = Student.new

    allow_any_instance_of(Student).to receive(:bar).and_raise(RuntimeError)

    expect {s1.bar}.to raise_error RuntimeError
  end
end

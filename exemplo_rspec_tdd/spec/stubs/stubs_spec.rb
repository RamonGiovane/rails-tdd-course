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
end

require 'calculator'
describe Calculator do
  context '#sum' do
    it 'with positive numbers' do
      result = subject.sum(5,7)
      expect(result).to eq(12)
    end

    it 'with negative numbers' do
      result = subject.sum(-5,-7)
      expect(result).to eq(-12)
    end
  end

  context '#div' do
    it 'divide by 0' do
      expect { subject.div(5,0) }.to raise_error ZeroDivisionError
      expect { subject.div(5,0) }.to raise_error(ZeroDivisionError, 'divided by 0')
      expect { subject.div(5,0) }.to raise_error('divided by 0')
      expect { subject.div(5,0) }.to raise_error(/divided/)
    end
  end
end
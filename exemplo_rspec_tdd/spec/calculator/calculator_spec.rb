require 'calculator'
describe Calculator do
  context '#sum' do
    it 'with positive numbers' do
      calc = Calculator.new
      result = calc.sum(5,7)
      expect(result).to eq(12)
    end

    it 'with negative numbers' do
      calc = Calculator.new
      result = calc.sum(-5,-7)
      expect(result).to eq(-12)
    end
  end

  context '#div' do
    it 'divide by 0' do
      calc = Calculator.new
      expect { calc.div(5,0) }.to raise_error ZeroDivisionError
      expect { calc.div(5,0) }.to raise_error(ZeroDivisionError, 'divided by 0')
      expect { calc.div(5,0) }.to raise_error('divided by 0')
      expect { calc.div(5,0) }.to raise_error(/divided/)
    end
  end
end
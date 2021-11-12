describe 'satisfy' do
  it { expect(9).to satisfy { |x| x % 3 == 0 } } # rubocop: disable Lint/AmbiguousBlockAssociation

  # A forma seguinte nao dispara Warning e tem melhor legibilidade
  it { expect(9).to satisfy('be a multiple of 3') { |x| x % 3 == 0 } }
end
